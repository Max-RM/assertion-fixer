import os

# Путь к файлу options.txt
path = os.path.join(os.getenv('APPDATA'), 'MinecraftPE_Netease', 'minecraftpe', 'options.txt')

# Проверка существования файла и пути
if not os.path.exists(path):
    # Создание папки и файла options.txt, если они не существуют
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, 'w') as f:
        f.write('dev_assertions_debug_break:0\n')
        f.write('dev_assertions_show_dialog:0\n')
else:
    # Чтение содержимого файла
    with open(path, 'r') as f:
        content = f.readlines()
        
    # Проверка наличия строк в файле и их замена
    if not any('dev_assertions_debug_break:' in s for s in content):
        content.append('dev_assertions_debug_break:0\n')
    else:
        content = [s.replace('dev_assertions_debug_break:1', 'dev_assertions_debug_break:0') for s in content]
    
    if not any('dev_assertions_show_dialog:' in s for s in content):
        content.append('dev_assertions_show_dialog:0\n')
    else:
        content = [s.replace('dev_assertions_show_dialog:1', 'dev_assertions_show_dialog:0') for s in content]

    # Запись измененного содержимого в файл
    with open(path, 'w') as f:
        f.writelines(content)

#Этот Файл создан организацией MDLC с использованием ChatGPT. 30.03.2023
