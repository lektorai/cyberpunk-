# CyberCityMobile (Godot 4) — Android APK via GitHub Actions

## Быстрый старт
1. Создай репозиторий на GitHub и **загрузи сюда весь проект** (включая этот файл и папку `.github/workflows`).  
2. Открой вкладку **Actions** в репозитории и **включи** GitHub Actions (если спрашивает).  
3. Запусти workflow **Build Android APK (Godot 4)** (кнопка *Run workflow*), либо просто сделай `git push` в `main`.  
4. По завершении сборки скачай APK:
   - В разделе **Actions → Run → Artifacts → CyberCityMobile-APK**, либо
   - В **Releases** — автоматически создастся релиз с файлом `CyberCityMobile.apk`.

## Примечания
- Сборка использует Godot **4.2.2** (headless) и экспортные шаблоны. Версию можно сменить в YAML (`GODOT_VER`).  
- Подпись: используется **debug keystore** (подходит для теста и установки на устройство). Для релиза—создай свой keystore и укажи его в `export_presets.cfg` и секретах GitHub.  
- APK генерится в `build/CyberCityMobile.apk` (см. `export_presets.cfg`).

## Локализация
RU/EN — подхватывается автоматически по языку устройства.

## Управление (мобилка)
Кнопки на экране: ГАЗ / ТОРМОЗ / ВЛЕВО / ВПРАВО.
