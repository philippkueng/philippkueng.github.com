Date: 2024-11-03
Title: Create a QR code from the command line
Tags: QR code, Tools, TIL

Lindsay, my wife, has been working on her [online shop (gestempelt & gedruckt — unique handicrafts inspired by nature)](https://gestempelt-und-gedruckt.ch/) for the last few months. Now that it’s complete, she's eager to get the word out with flyers. For this, she needed a QR code with the shop's URL to make it easier for people to scan.

So how do you generate a white QR code with the rest being transparent without needing to sign up to a website?

Use [qrencode](https://fukuchi.org/works/qrencode/) and [ImageMagick](https://imagemagick.org/) on the command line.

First, install the applications using:

```bash
brew install qrencode imagemagick
```

Then, generate the QR code:

```bash
# Create the QR code (white on black).
qrencode -s 20 --foreground=ffffff --background=000000 -l H -o "URL.png" "https://gestempelt-und-gedruckt.ch/"

# Replace black with "transparent".
convert URL.png -fuzz 10% -transparent black URL_transparent.png
```
