import os
import json
from mutagen.mp3 import MP3

# Folder containing your mp3 files
folder = "assets/audio/affasy/"
output_file = "assets/audio/affasy/durations.json"

durations = {}

for filename in os.listdir(folder):
    if filename.endswith(".mp3"):
        path = os.path.join(folder, filename)
        audio = MP3(path)
        seconds = int(audio.info.length)
        minutes, sec = divmod(seconds, 60)
        hours, minutes = divmod(minutes, 60)
        duration_str = f"{hours:02}:{minutes:02}:{sec:02}"
        name_without_ext = os.path.splitext(filename)[0]
        durations[name_without_ext] = duration_str

# Save JSON to a file
with open(output_file, "w", encoding="utf-8") as f:
    json.dump(durations, f, indent=2, ensure_ascii=False)

print(f"Saved durations to {output_file}")