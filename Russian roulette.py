games = {}

class RussianRouletteGame:
    def __init__(self, max_capacity):
        self.max_capacity = max_capacity
        self.players = []
        self.bullet_position = random.randint(1, 6)
        self.trigger_pulls = 0
        self.current_turn = 0

    def add_player(self, player):
        if len(self.players) < self.max_capacity:
            self.players.append(player)
            return True
        return False

    def is_full(self):
        return len(self.players) >= self.max_capacity

    def pull_trigger(self):
        self.trigger_pulls += 1
        if self.trigger_pulls == self.bullet_position:
            return True  # Player loses
        return False  # Player survives
    def spintrig(self):
        self.trigger_pulls += 2
        if self.trigger_pulls == self.bullet_position:
            return True  # Player loses
        return False  # Player survives
    def next_player(self):
        self.current_turn = (self.current_turn + 1) % len(self.players)
        return self.players[self.current_turn]
@bot.event
async def on_ready():
    print(f'Logged in as {bot.user.name}')

@bot.command(name='game')
async def game(ctx, max_capacity: int):
    if ctx.author.id in games:
        await ctx.send(f'You already have an active game, {ctx.author.mention}!')
        return

    new_game = RussianRouletteGame(max_capacity)
    games[ctx.author.id] = new_game
    await ctx.send(f'Russian Roulette game created by {ctx.author.mention}! Type `.joing` to join the game. Max capacity: {max_capacity}')

@bot.command(name='joing')
async def joing(ctx):
    # Find an active game to join
    for game_owner_id, game in games.items():
        if not game.is_full():
            if game.add_player(ctx.author):
                await ctx.send(f'{ctx.author.mention} joined the game!')
                if game.is_full():
                    await ctx.send(f'The game is now full! The game starts now.')
                    await ctx.send(f'{game.players[game.current_turn].mention}, it\'s your turn to pull the trigger! Type `.pull or .spinpull`.')
                return
            else:
                await ctx.send(f'Sorry, {ctx.author.mention}, the game is full!')
                return

    await ctx.send('No active games to join. You can start a new game with `.game <max_capacity>`.')

@bot.command(name='pull')
async def pull(ctx):
    for game_owner_id, game in games.items():
        if ctx.author in game.players:
            if ctx.author == game.players[game.current_turn]:
                if game.pull_trigger():
                    await ctx.send(f'**BANG!** {ctx.author.mention} has lost the game!')
                    del games[game_owner_id]
                else:
                    await ctx.send(f'**Click.** {ctx.author.mention} survived.')
                    next_player = game.next_player()
                    await ctx.send(f'{next_player.mention}, it\'s your turn to pull the trigger! Type `.pull or .spinpull`.')
                return
            else:
                await ctx.send(f'It\'s not your turn, {ctx.author.mention}.')
                return

    await ctx.send(f'You are not in an active game, {ctx.author.mention}. Type `.joing` to joing a game or `.game <max_capacity>` to start a new one.')
@bot.command(name='spinpull')
async def spinpull(ctx):
    for game_owner_id, game in games.items():
        if ctx.author in game.players:
            if ctx.author == game.players[game.current_turn]:
                if game.spintrig():
                    await ctx.send(f'**BANG!** {ctx.author.mention} has lost the game!')
                    del games[game_owner_id]
                else:
                    await ctx.send(f'**Click.** {ctx.author.mention} survived.')
                    next_player = game.next_player()
                    await ctx.send(f'{next_player.mention}, it\'s your turn to pull the trigger! Type `.pull or .spinpull`.')
                return
            else:
                await ctx.send(f'It\'s not your turn, {ctx.author.mention}.')
                return

    await ctx.send(f'You are not in an active game, {ctx.author.mention}. Type `.joing` to joing a game or `.game <max_capacity>` to start a new one.')

@bot.command(name='cancel')
async def cancel(ctx):
    if ctx.author.id in games:
        del games[ctx.author.id]
        await ctx.send(f'{ctx.author.mention} cancelled the game.')
    else:
        await ctx.send(f'You do not have an active game to cancel, {ctx.author.mention}.')
