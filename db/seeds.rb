# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Вводим текст
@raw_text = "Дом Наркомфина — один из знаковых памятников архитектуры советского авангарда и конструктивизма. Построен в 1928—1930 годах по проекту архитекторов Моисея Гинзбурга, Игнатия Милиниса и инженера Сергея Прохорова для работников Народного комиссариата финансов СССР (Наркомфина). Автор замысла дома Наркомфина Гинзбург определял его как «опытный дом переходного типа». Дом находится в Москве по адресу: Новинский бульвар, дом 25, корпус 1. С начала 1990-х годов дом находился в аварийном состоянии, был трижды включён в список «100 главных зданий мира, которым грозит уничтожение». В 2017—2020 годах отреставрирован по проекту АБ «Гинзбург Архитектс», функционирует как элитный жилой дом. Отдельно стоящий «Коммунальный блок» (историческое название) планируется как место проведения публичных мероприятий."

# Убираем из текста лишние символы и down-кейсим слова
@words = @raw_text.downcase.gsub(/[—.—,«»:()]/, '').gsub(/  /, ' ').split(' ')

# Список сообществ
@communities = [
    {
        title: 'Центр лидерства и волонтёрства',
        link: 'https://vk.com/hse_volunteers ',
        body: 'Волонтёрский центр Вышки – это команда инициативных и неравнодушных студентов, выпускников и сотрудников университета. Мы помогаем с организацией самых крупных вышкинских проектов: развлекательных и научных. Участвуем в городских фестивалях и конференциях. А ещё помогаем старшему поколению онлайн изучать иностранные языки и школьникам из Москвы и регионов не отставать по школьным предметам.'
    },
    {
        title: 'Студенческий совет НИУ ВШЭ',
        link: 'https://vk.com/hsecouncil',
        body: 'Студсовет Вышки'
    },
    {
        title: 'HSE Outreach',
        link: 'https://vk.com/hseoutreach',
        body: 'HSE Outreach — старейшая и одна из крупнейших благотворительных организаций в Вышке.'
    },
    {
        title: 'Экологический клуб “Зелёная Вышка”',
        link: 'https://vk.com/hsegreen',
        body: 'Экологический клуб'
    },
    {
        title: 'Спортивный клуб',
        link: 'https://vk.com/hsessc',
        body: 'Спорт для нас — не только здоровый образ жизни. Это люди, традиции и гордость нашего университета.'
    },
    {
        title: 'InsideOut',
        link: 'https://vk.com/insideout_hse',
        body: 'InsideOut – студенческая организация, выворачивающая «наизнанку» стереотипы об однообразной жизни студентов факультета Мировой Экономики и Мировой Политики. '
    },
    {
        title: 'Клуб вьетнамской культуры',
        link: 'https://vk.com/vietnamculturehse',
        body: 'Xin chào! Мы – клуб вьетнамской культуры ВШЭ, сообщество энтузиастов, исследующих жизнь Вьетнама'
    }
]

# Функция очистки и наполнения бд через сиды
def seed
    reset_db
    create_communities
    create_events(10)
    create_comments(2..8)
end

# Функция очистки бд, которую встраиваем в seed
def reset_db
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
end

# Функция генерации предложений
def create_sentence
    # Создаем список предложений
    sentence_words = []

    # Добавляем 10-20 слов из words как один объект списка
    (10..20).to_a.sample.times do
        sentence_words << @words.sample
    end

    # Объединяем строку через пробел, делаем первую букву заглавной и ставим точну в конце
    sentence_words.join(' ').capitalize + '.'
end

# Функция загрузки рандомного изображения к ивенту
def upload_random_image
    uploader = EventImageUploader.new(Event.new, :event_image)
    uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/events', '*')).sample))
    uploader
end

# Функция создания ивентов (quantity раз)
def create_events(quantity)
    quantity.times do |i|
        event = Event.create(title: "Ивент №#{i + 1}", body: create_sentence, author: 'Дима', event_image: upload_random_image, community_id: 1)
        puts "Event with id #{event.id} just created!"
    end
end

# Функция создания комментариев ко всем ивентам (quantity слов в комментарии)
def create_comments(quantity)
    Event.all.each do |event|
        quantity.to_a.sample.times do
            comment = Comment.create(event_id: event.id, body: create_sentence)
            puts "Comment #{comment.id} for event #{comment.event.id} just created!"
        end
    end
end

# Функция создания сообществ
def create_communities
    @communities.each do |community|
        community = Community.create(community)
        puts "Community #{ community.title } with id #{ community.id } just created!"
    end
end

seed
