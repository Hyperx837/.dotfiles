import asyncio
import random
import webbrowser

import aiohttp


async def get_meme():
    async with aiohttp.ClientSession() as session:
        async with session.get("http://alpha-meme-maker.herokuapp.com/") as response:
            resp = await response.json()
            if response.status == 200:
                memes = resp["data"]
                meme = random.choice(memes)
                return meme["name"], meme["image"], meme["topText"], meme["bottomText"]


async def main():
    name, image_url, top_text, bottom_text = await get_meme()
    print("Meme name: ", name)
    print("Image url: ", image_url)
    print("Top Text: ", top_text)
    print("Bottom Text: ", bottom_text)
    webbrowser.open(image_url)


if __name__ == "__main__":
    asyncio.run(main())
