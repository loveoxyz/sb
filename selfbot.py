import json
import random
import asyncio
import discord

from discord.ext import commands

intents = discord.Intents.default()
intents.messages = True

bot = commands.Bot(intents=intents, command_prefix='!', self_bot=True)

with open('./settings.json', 'r') as config_file:
    config_data = json.load(config_file)

async def start_spammer():
    channels_to_send = config_data.get('spam_channels')
    while True:
        for id in channels_to_send:
            try:
                channel = await bot.fetch_channel(id)
                if channel:
                    random_number = ''.join(random.choice('0123456789') for _ in range(27))
                    await channel.send(random_number)
                    await asyncio.sleep(random.uniform(3, 6))
            except discord.HTTPException as e:
                if e.status == 429:
                    print(f"Rate limited. Sleeping for {e.retry_after + 2}...")
                    await asyncio.sleep(e.retry_after + 2)
                    continue
                else:
                    print(f'Unhandled error: `{e}`')
                    continue

@bot.event
async def on_ready():
    print(f'Ready: {bot.user.name}({bot.user.id})')
    await start_spammer()

bot.run(config_data.get('token'), bot=False)