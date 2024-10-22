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

# Список факультетов
@faculties = [
    { name: 'Факультет креативных индустрий (Faculty of Creative Industries)',
      programs: [
        { name: 'Дизайн', faculty_id: 1 },
        { name: 'Реклама и связи с общественностью', faculty_id: 1 },
        { name: 'Медиакоммуникации', faculty_id: 1 },
        { name: 'Журналистика', faculty_id: 1 },
        { name: 'Мода', faculty_id: 1 },
        { name: 'Современное искусство', faculty_id: 1 },
        { name: 'Стратегия и продюсирование в коммуникациях', faculty_id: 1 },
        { name: 'Коммуникационный и цифровой дизайн', faculty_id: 1 },
        { name: 'Кинопроизводство', faculty_id: 1 },
        { name: 'Управление в креативных индустриях', faculty_id: 1 },
        { name: 'Управление стратегическими коммуникациями', faculty_id: 1 },
        { name: 'Интегрированные коммуникации', faculty_id: 1 },
        { name: 'Трансмедийное производство в цифровых индустриях', faculty_id: 1 },
        { name: 'Современная журналистика', faculty_id: 1 },
        { name: 'Медиаменеджмент', faculty_id: 1 },
        { name: 'Практики современного искусства', faculty_id: 1 },
        { name: 'Программа двух дипломов НИУ ВШЭ и ДГТУ "Нейромедиа"', faculty_id: 1 },
        { name: 'Актер', faculty_id: 1 },
        { name: 'Коммуникации в государственных структурах и НКО', faculty_id: 1 },
        { name: 'Коммуникации, основанные на данных', faculty_id: 1 },
        { name: 'Практики кураторства в современном искусстве', faculty_id: 1 },
        { name: 'Критические медиаисследования', faculty_id: 1 },
        { name: 'Дизайн среды', faculty_id: 1 },
        { name: 'Современные технологии преподавания дизайна и искусства', faculty_id: 1 },
        { name: 'Современный дизайн в преподавании изобразительного искусства и технологии в школе', faculty_id: 1 }
      ]
    },
    { name: 'Высшая школа бизнеса (Graduate School of Business)',
      programs: [
        { name: 'Управление бизнесом', faculty_id: 2 },
        { name: 'Бизнес-информатика', faculty_id: 2 },
        { name: 'Маркетинг и рыночная аналитика', faculty_id: 2 },
        { name: 'Управление цифровым продуктом', faculty_id: 2 },
        { name: 'Маркетинг: цифровые технологии и маркетинговые коммуникации', faculty_id: 2 },
        { name: 'Международный бизнес', faculty_id: 2 },
        { name: 'Цифровые инновации в управлении предприятием', faculty_id: 2 },
        { name: 'Бизнес-информатика: цифровое предприятие и управление информационными системами', faculty_id: 2 },
        { name: 'Управление цепями поставок и бизнес-аналитика', faculty_id: 2 },
        { name: 'Маркетинг - менеджмент', faculty_id: 2 },
        { name: 'Стратегический менеджмент и консалтинг', faculty_id: 2 },
        { name: 'Бизнес-аналитика и системы больших данных', faculty_id: 2 },
        { name: 'Международный менеджмент', faculty_id: 2 },
        { name: 'Электронный бизнес и цифровые инновации', faculty_id: 2 },
        { name: 'Производственные системы и операционная эффективность', faculty_id: 2 },
        { name: 'Управление логистикой и цепями поставок в бизнесе', faculty_id: 2 },
        { name: 'Международный спортивный менеджмент, маркетинг и право', faculty_id: 2 },
        { name: 'Менеджмент в ритейле', faculty_id: 2 },
        { name: 'Логистика и управление цепями поставок', faculty_id: 2 },
        { name: 'Управление исследованиями, разработками и инновациями в компании', faculty_id: 2 },
        { name: 'Юрист мирового финансового рынка', faculty_id: 2 },
        { name: 'Стратегическое управление логистикой и цепями поставок в цифровой экономике', faculty_id: 2 },
        { name: 'Управление инвестиционными проектами', faculty_id: 2 },
        { name: 'Управление людьми: цифровые технологии и организационное развитие', faculty_id: 2 },
        { name: 'Управление устойчивым развитием компании', faculty_id: 2 },
        { name: 'Международный корпоративный комплаенс и этика бизнеса', faculty_id: 2 },
        { name: 'Церковь, общество и государство. Правовое регулирование деятельности религиозных объединений', faculty_id: 2 },
        { name: 'Государственно-конфессиональные отношения. Правовое регулирование деятельности религиозных объединений', faculty_id: 2 }
      ]
    },
    { name: 'Факультет социальных наук (Faculty of Social Sciences)',
      programs: [
        { name: 'Психология', faculty_id: 3 },
        { name: 'Государственное и муниципальное управление', faculty_id: 3 },
        { name: 'Социология', faculty_id: 3 },
        { name: 'Психоанализ и психоаналитическое бизнес-консультирование', faculty_id: 3 },
        { name: 'Психоанализ и психоаналитическая психотерапия', faculty_id: 3 },
        { name: 'Политология', faculty_id: 3 },
        { name: 'Управление образованием', faculty_id: 3 },
        { name: 'Психология в бизнесе', faculty_id: 3 },
        { name: 'Консультативная психология. Персонология', faculty_id: 3 },
        { name: 'Управление в высшем образовании', faculty_id: 3 },
        { name: 'Управление в сфере науки, технологий и инноваций', faculty_id: 3 },
        { name: 'Управление и экономика здравоохранения', faculty_id: 3 },
        { name: 'Педагогическое образование', faculty_id: 3 },
        { name: 'Политика. Экономика. Философия', faculty_id: 3 },
        { name: 'Обучение и оценивание как наука', faculty_id: 3 },
        { name: 'Социология публичной сферы и цифровая аналитика', faculty_id: 3 },
        { name: 'Прикладная социальная психология', faculty_id: 3 },
        { name: 'Доказательное развитие образования', faculty_id: 3 },
        { name: 'Когнитивные науки и технологии: от нейрона к познанию', faculty_id: 3 },
        { name: 'Вычислительные социальные науки', faculty_id: 3 },
        { name: 'Прикладная политология', faculty_id: 3 },
        { name: 'Современные социальные науки в преподавании обществознания в школе', faculty_id: 3 },
        { name: 'Прикладные методы социального анализа рынков', faculty_id: 3 },
        { name: 'Системная семейная психотерапия', faculty_id: 3 },
        { name: 'Позитивная психология', faculty_id: 3 },
        { name: 'Сравнительные социальные исследования', faculty_id: 3 },
        { name: 'Население и развитие', faculty_id: 3 },
        { name: 'Комплексный социальный анализ', faculty_id: 3 },
        { name: 'Демография', faculty_id: 3 },
        { name: 'Прикладная статистика с методами сетевого анализа', faculty_id: 3 },
        { name: 'Цифровая трансформация образования', faculty_id: 3 },
        { name: 'Педагогичеcкая деятельность в условиях изменений', faculty_id: 3 },
        { name: 'Социология публичной и деловой сферы', faculty_id: 3 },
        { name: 'Управление низкоуглеродным развитием', faculty_id: 3 },
        { name: 'Политический анализ и публичная политика', faculty_id: 3 },
        { name: 'Филологическая герменевтика школьной словесности', faculty_id: 3 }
      ]
    }
]

# Функция очистки и наполнения бд через сиды
def seed
    reset_db
    create_faculties
    create_programs
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

# Функция создания факультетов
def create_faculties
    @faculties.each do |faculty|
        faculty = Faculty.create(name: faculty[:name])
        puts "Faculty #{ faculty.name } just created"
    end
end

# Функция создания программ
def create_programs
    @faculties.each do |faculty|
        faculty[:programs].each do |program|
            program = Program.create(program)
            puts "Program #{ program.name } just created"
        end
    end
end

seed
