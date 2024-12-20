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
    },
    { name: 'Факультет компьютерных наук (Faculty of Computer Science)',
      programs: [
        { name: 'Прикладная математика и информатика', faculty_id: 4 },
        { name: 'Программная инженерия', faculty_id: 4 },
        { name: 'Прикладной анализ данных', faculty_id: 4 },
        { name: 'Магистр по наукам о данных', faculty_id: 4 },
        { name: 'Машинное обучение и высоконагруженные системы', faculty_id: 4 },
        { name: 'Экономика и анализ данных', faculty_id: 4 },
        { name: 'Науки о данных', faculty_id: 4 },
        { name: 'Компьютерные науки и анализ данных', faculty_id: 4 },
        { name: 'Финансовые технологии и анализ данных', faculty_id: 4 },
        { name: 'Современные компьютерные науки', faculty_id: 4 },
        { name: 'Анализ данных в биологии и медицине', faculty_id: 4 },
        { name: 'Системная и программная инженерия', faculty_id: 4 },
        { name: 'Математика машинного обучения', faculty_id: 4 },
        { name: 'Системное программирование', faculty_id: 4 },
        { name: 'Анализ данных в девелопменте', faculty_id: 4 }
      ]
    },
    { name: 'Факультет экономических наук (Faculty of Economic Sciences)',
      programs: [
        { name: 'Экономика', faculty_id: 5 },
        { name: 'Экономика и статистика', faculty_id: 5 },
        { name: 'Совместная программа по экономике НИУ ВШЭ и РЭШ', faculty_id: 5 },
        { name: 'Экономика и экономическая политика', faculty_id: 5 },
        { name: 'Корпоративные финансы', faculty_id: 5 },
        { name: 'Стратегическое управление финансами фирмы', faculty_id: 5 },
        { name: 'Экономический анализ', faculty_id: 5 },
        { name: 'Экономика и анализ данных', faculty_id: 5 },
        { name: 'Финансовый инжиниринг', faculty_id: 5 },
        { name: 'Финансовые рынки и финансовые институты', faculty_id: 5 },
        { name: 'Магистр аналитики бизнеса', faculty_id: 5 },
        { name: 'Инвестиции на финансовых рынках', faculty_id: 5 },
        { name: 'Международная торговая политика', faculty_id: 5 },
        { name: 'Финансы', faculty_id: 5 },
        { name: 'Финансовый аналитик', faculty_id: 5 },
        { name: 'Стохастическое моделирование в экономике и финансах', faculty_id: 5 },
        { name: 'Статистический анализ в экономике', faculty_id: 5 },
        { name: 'Аналитик деловой разведки', faculty_id: 5 },
        { name: 'Совместная программа бакалавриата по экономике НИУ ВШЭ и ДВФУ', faculty_id: 5 },
        { name: 'Аграрная экономика', faculty_id: 5 }
      ]
    },
    { name: 'Факультет мировой экономики и мировой политики (Faculty of World Economy and International Affairs)',
      programs: [
        { name: 'Востоковедение', faculty_id: 6 },
        { name: 'Мировая экономика', faculty_id: 6 },
        { name: 'Программа двух дипломов НИУ ВШЭ и Университета Кёнхи "Экономика и политика в Азии"', faculty_id: 6 },
        { name: 'Международные отношения', faculty_id: 6 },
        { name: 'Международная программа "Международные отношения и глобальные исследования"', faculty_id: 6 },
        { name: 'Международные отношения: европейские и азиатские исследования', faculty_id: 6 },
        { name: 'Социально-экономическое и политическое развитие современной Азии', faculty_id: 6 },
        { name: 'Программа двух дипломов НИУ ВШЭ и Университета Кёнхи "Экономика, политика и бизнес в Азии"', faculty_id: 6 },
        { name: 'Экономика окружающей среды и устойчивое развитие', faculty_id: 6 }
      ]
    },
    { name: 'Факультет гуманитарных наук (Faculty of Humanities)',
      programs: [
        { name: 'Филология', faculty_id: 7 },
        { name: 'История', faculty_id: 7 },
        { name: 'Фундаментальная и компьютерная лингвистика', faculty_id: 7 },
        { name: 'Философия', faculty_id: 7 },
        { name: 'Культурология', faculty_id: 7 },
        { name: 'История искусств', faculty_id: 7 },
        { name: 'Античность', faculty_id: 7 },
        { name: 'Культурные исследования', faculty_id: 7 },
        { name: 'Литературное мастерство', faculty_id: 7 },
        { name: 'Современная историческая наука в преподавании истории в школе', faculty_id: 7 },
        { name: 'Компьютерная лингвистика', faculty_id: 7 },
        { name: 'История художественной культуры и рынок искусства', faculty_id: 7 },
        { name: 'Философская антропология', faculty_id: 7 },
        { name: 'Русский как иностранный во взаимодействии языков и культур', faculty_id: 7 },
        { name: 'Цифровые методы в гуманитарных науках', faculty_id: 7 },
        { name: 'Современная филология в преподавании литературы в школе', faculty_id: 7 },
        { name: 'Античная и восточная археология', faculty_id: 7 },
        { name: 'Русская литература и компаративистика', faculty_id: 7 },
        { name: 'История современного мира', faculty_id: 7 },
        { name: 'Языковая политика в условиях этнокультурного разнообразия', faculty_id: 7 },
        { name: 'Восточноевропейские исследования', faculty_id: 7 },
        { name: 'Мусульманские миры в России (История и культура)', faculty_id: 7 },
        { name: 'Лингвистическая теория и описание языка', faculty_id: 7 },
        { name: 'Germanica: история и современность', faculty_id: 7 },
        { name: 'Языки и литература Юго-Восточной Азии', faculty_id: 7 },
        { name: 'Медиевистика', faculty_id: 7 },
        { name: 'Современная филология в преподавании русского языка и литературы в школе', faculty_id: 7 },
        { name: 'Библеистика и история древнего Израиля', faculty_id: 7 },
        { name: 'Классический и современный Восток: языки, культуры, религии', faculty_id: 7 },
        { name: 'Язык, словесность и культура Кореи', faculty_id: 7 },
        { name: 'Религия и общество', faculty_id: 7 },
        { name: 'Язык, словесность и культура Китая', faculty_id: 7 },
        { name: 'Язык и литература Ирана', faculty_id: 7 },
        { name: 'Языки и литература Индии', faculty_id: 7 },
        { name: 'Язык и литература Японии', faculty_id: 7 },
        { name: 'Философия и история религии', faculty_id: 7 },
        { name: 'Ассириология', faculty_id: 7 },
        { name: 'Христианский Восток', faculty_id: 7 },
        { name: 'Египтология', faculty_id: 7 },
        { name: 'Эфиопия и арабский мир', faculty_id: 7 },
        { name: 'Монголия и Тибет', faculty_id: 7 },
        { name: 'Арабистика: язык, словесность, культура', faculty_id: 7 },
        { name: 'Турция и тюркский мир', faculty_id: 7 }
      ]
    },
    { name: 'Московский институт электроники и математики им. А.Н. Тихонова (Tikhonov Moscow Institute of Electronics and Mathematics)',
      programs: [
        { name: 'Информатика и вычислительная техника', faculty_id: 8 },
        { name: 'Информационная безопасность', faculty_id: 8 },
        { name: 'Прикладная математика', faculty_id: 8 },
        { name: 'Компьютерная безопасность', faculty_id: 8 },
        { name: 'Инфокоммуникационные технологии и системы связи', faculty_id: 8 },
        { name: 'Компьютерные системы и сети', faculty_id: 8 },
        { name: 'Кибербезопасность', faculty_id: 8 },
        { name: 'Системный анализ и математические технологии', faculty_id: 8 },
        { name: 'Интернет вещей и киберфизические системы', faculty_id: 8 },
        { name: 'Прикладная электроника и фотоника', faculty_id: 8 },
        { name: 'Информационная безопасность киберфизических систем', faculty_id: 8 },
        { name: 'Прикладные модели искусственного интеллекта', faculty_id: 8 }
      ]
    },
    { name: 'Факультет права (Faculty of Law)',
      programs: [
        { name: 'Юриспруденция', faculty_id: 9 },
        { name: 'Право', faculty_id: 9 },
        { name: 'Юрист в бизнесе', faculty_id: 9 },
        { name: 'Цифровое право', faculty_id: 9 },
        { name: 'Цифровой юрист', faculty_id: 9 },
        { name: 'Юрист в правосудии', faculty_id: 9 },
        { name: 'Корпоративное и международное частное право', faculty_id: 9 },
        { name: 'Юриспруденция: частное право', faculty_id: 9 },
        { name: 'Право международной торговли и разрешение споров', faculty_id: 9 },
        { name: 'ЛигалТех', faculty_id: 9 },
        { name: 'Фармправо и здравоохранение', faculty_id: 9 },
        { name: 'Комплаенс и профилактика правовых рисков', faculty_id: 9 },
        { name: 'Публичное право', faculty_id: 9 },
        { name: 'Юриспруденция: гражданское и предпринимательское право', faculty_id: 9 },
        { name: 'Публичное право и публичные финансы', faculty_id: 9 },
        { name: 'Теоретическое и сравнительное правоведение', faculty_id: 9 },
        { name: 'Право: исследовательская программа', faculty_id: 9 },
        { name: 'Правовое сопровождение бизнеса', faculty_id: 9 },
        { name: 'Право международной торговли, финансов и экономической интеграции', faculty_id: 9 },
        { name: 'Международное частное право и международный коммерческий арбитраж', faculty_id: 9 },
        { name: 'Правовое регулирование в фармацевтике и биотехнологиях', faculty_id: 9 },
        { name: 'История, теория и философия права', faculty_id: 9 },
        { name: 'Финансовое, налоговое и таможенное право', faculty_id: 9 },
        { name: 'Корпоративный юрист', faculty_id: 9 }
      ]
    },
    { name: 'Школа иностранных языков (School of Foreign Languages)',
      programs: [
        { name: 'Иностранные языки и межкультурная коммуникация', faculty_id: 10 }
      ]
    },
    { name: 'Факультет городского и регионального развития (Faculty of Urban and Regional Development)',
      programs: [
        { name: 'Городское планирование', faculty_id: 11 },
        { name: 'Управление пространственным развитием городов', faculty_id: 11 },
        { name: 'Цифровая урбанистика и аналитика города', faculty_id: 11 }
      ]
    },
    { name: 'Факультет математики (Faculty of Mathematics)',
      programs: [
        { name: 'Математика', faculty_id: 12 },
        { name: 'Совместный бакалавриат НИУ ВШЭ и ЦПМ', faculty_id: 12 },
        { name: 'Совместная магистратура НИУ ВШЭ и ЦПМ', faculty_id: 12 },
        { name: 'Математика и математическая физика', faculty_id: 12 }
      ]
    },
    { name: 'Факультет биологии и биотехнологии (Faculty of Biology and Biotechnology)',
      programs: [
        { name: 'Клеточная и молекулярная биотехнология', faculty_id: 13 },
        { name: 'Когнитивная нейробиология', faculty_id: 13 },
        { name: 'Биоэкономика', faculty_id: 13 }
      ]
    },
    { name: 'Факультет физики (Faculty of Physics)',
      programs: [
        { name: 'Физика', faculty_id: 14 }
      ]
    },
    { name: 'Факультет географии и геоинформационных технологий (Faculty of Geography and Geoinformation Technology)',
      programs: [
        { name: 'География глобальных изменений и геоинформационные технологии', faculty_id: 15 },
        { name: 'Управление низкоуглеродным развитием', faculty_id: 15 }
      ]
    },
    { name: 'Факультет химии (Faculty of Chemistry)',
      programs: [
        { name: 'Химия', faculty_id: 16 },
        { name: 'Химия молекулярных систем и материалов', faculty_id: 16 }
      ]
    }
]

# Функция очистки и наполнения бд через сиды
def seed
    reset_db
    create_users(10)
    create_faculties
    create_programs
    create_communities
    create_events(10)
    create_meets(10)
    create_e_comments(2..8)
    create_m_comments(2..8)
end

# Функция очистки бд, которую встраиваем в seed
def reset_db
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
end

# Функция создания пользователей
def create_users(quantity)
    i = 0

    quantity.times do
        user_data = {
            email: "user_#{i}@email.com",
            password: "testtest",
            username: "user#{i}"
        }

        if i == 0
          user_data[:role] = "admin"
          user_data[:username] = "admin"
        end

        user = User.create!(user_data)
        puts "User created with id #{user.id}"
        i += 1
    end
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

# Делаем рандом для ивентов (паблик / не паблик)
def get_random_bool
  [ true, false ].sample
end

# Функция создания ивентов (quantity раз)
def create_events(quantity)
    quantity.times do |i|
        user = User.all.sample
        event = Event.create(title: "Ивент №#{i + 1}", body: create_sentence, event_image: upload_random_image, community_id: 1, user_id: user.id, public: get_random_bool)
        puts "Event with id #{event.id} just created!"
    end
end

# Функция создания митов (quantity раз)
def create_meets(quantity)
  quantity.times do
      user = User.all.sample
      meet = Meet.create(body: create_sentence, date_hosted: DateTime.current.to_date, geotag: 'Покра', user_id: user.id)
      puts "Meet with id #{meet.id} just created!"
  end
end

# Функция создания комментариев ко всем ивентам (quantity слов в комментарии)
def create_e_comments(quantity)
    Event.all.each do |event|
        quantity.to_a.sample.times do
            user = User.all.sample
            e_comment = EComment.create(event_id: event.id, body: create_sentence, user_id: user.id)
            puts "Comment #{e_comment.id} for event #{e_comment.event.id} just created!"
        end
    end
end

# Функция создания комментариев ко всем митам (quantity слов в комментарии)
def create_m_comments(quantity)
  Meet.all.each do |meet|
      quantity.to_a.sample.times do
          user = User.all.sample
          m_comment = MComment.create(meet_id: meet.id, body: create_sentence, user_id: user.id)
          puts "Comment #{m_comment.id} for meet #{m_comment.meet.id} just created!"
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

# terminal | write command   | rails g controller api/v1/events
# code     | create folder   | views/api/v1/events
# code     | write code      | def index in controller/api/v1/events
# code     | write code      | namespace :api, namespace :v1, resources :events, only: [:index, :show] in config/routes
# code     | X write code    | api_v1_events_url or api_v1_events_path in views/welcome/index
# code     | X write code    | format: 'json' to namespace :api in config/routes
# code     | X write code    | render json: @events.as_json to def index in controller/api/v1/events
# note     | .as_json(except: :title) or .as_json(only: :title)
# note     | self.something self for @ objects
# code     | X write code    | def as_json in models/event
# code     | change folder   | json.jbuilder from views/events to views/api/v1/events
# code     | write code      | partial: "api/v1/events/event" in views/api/v1/events/index
# code     | write code      | delete format: :json in views/api/v1/events/_event
# code     | write code      | def show with @event = Event.find(params[:id]) in controller/api/v1/events
# code     | write code      | partial: "api/v1/events/event" in views/api/v1/events/show
# code     | delete code     | json.partial! "api/v1/events/event", event: @event in views/api/v1/events/show
# code     | write code      | json.extract! @event, :id, :title, :body, :created_at, :updated_at in views/api/v1/events/show
# code     | write code      | json.set! :e_comments with json.array! @event.e_comments, partial: "api/v1/events/e_comment", as: :e_comment in views/api/v1/events/show
# code     | write code      | json.extract! e_comment, :id, :body, :created_at, :user_id in views/api/v1/events/_e_comment
# code     | write code      | def asset_host in uploaders_event_image

# code     | write code      | gem "rack-cors" in gemfile
# terminal | write command   | bundle install
# code     | create file     | cors.rb in config/initializers
# code     | write code      | Rails.application.config.middleware.insert_before 0, Rack::Cors do
#                                allow do
#                                  origins 'http://localhost:3000/'
#                                  resource '*', headers: :any, methods: [:get, :post]
#                                end
#                              end
#                              in cors.rb

# terminal | write command   | rails g scaffold profile name:string body:text contact:string avatar:string user:references
# terminal | write command   | rails db:migrate
# code     | write code      | accosiations in models/user and models/profile
# code     | X write code    | private def create_user_profile with self.create_profile() in models/user
# code     | X write code    | after_create :create_user_profile in models/user
# code     | write code      | after_create :create_profile in models/user
