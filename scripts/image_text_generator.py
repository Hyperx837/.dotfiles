from PIL import Image, ImageDraw, ImageFont
from pathlib import Path
import random
import sys

font_dir = Path("~/.local/share/fonts").expanduser()
font = random.choice([str(f) for f in font_dir.iterdir()])

print(font)

if sys.argv[1] == "-h" or sys.argv[1] == "--help":
    print("Usage: python3 add_text_to_image.py <input_image> <text> <output_image>")
    sys.exit(0)

if sys.argv[1] == "-v" or sys.argv[1] == "--version":
    print("add_text_to_image.py v1.0")
    sys.exit(0)

if len(sys.argv) < 3:
    print("Usage: python3 add_text_to_image.py <input_image> <text> <output_image>")
    sys.exit(1)


# grab random frame from video python
myFrameNumber = 50
cap = cv2.VideoCapture("video.mp4")

# get total number of frames
totalFrames = cap.get(cv2.CAP_PROP_FRAME_COUNT)

# check for valid frame number
if myFrameNumber >= 0 & myFrameNumber <= totalFrames:
    # set frame position
    cap.set(cv2.CAP_PROP_POS_FRAMES,myFrameNumber)

while True:
    ret, frame = cap.read()
    cv2.imshow("Video", frame)
    if cv2.waitKey(20) & 0xFF == ord('q'):
        break

cv2.destroyAllWindows()

def add_tilted_text_to_image(image_path, text, output_path):
    img = Image.open(image_path)
    draw = ImageDraw.Draw(img)
    draw.text((10, 10), text, fill=(255, 255, 0), font=ImageFont.truetype(font, 40), direction=None,
              spacing=0, align="left")
    img.show()
    if input() in { "y", "Y", "yes", "Yes", "YES", "" }:
        img.save(output_path)
    else:
        add_tilted_text_to_image(image_path, text, output_path)

if __name__ == "__main__":
    output_path = sys.argv[3] if len(sys.argv) > 3 else "."
    add_tilted_text_to_image(sys.argv[1], sys.argv[2], output_path)
