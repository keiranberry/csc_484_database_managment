USE pokemonDB;

INSERT INTO Generation (Id, Name) VALUES
(1, 'Generation I'),
(2, 'Generation II');

INSERT INTO Region (Id, Name, GenerationId) VALUES
(1, 'Kanto', 1),
(2, 'Johto', 2);

INSERT INTO Type (Id, Name) VALUES
(1, 'Normal'),
(2, 'Fire'),
(3, 'Water'),
(4, 'Electric'),
(5, 'Grass'),
(6, 'Ice'),
(7, 'Fighting'),
(8, 'Poison'),
(9, 'Ground'),
(10, 'Flying'),
(11, 'Psychic'),
(12, 'Bug'),
(13, 'Rock'),
(14, 'Ghost'),
(15, 'Dragon'),
(16, 'Dark'),
(17, 'Steel'),
(18, 'Fairy');

INSERT INTO Pokemon (Name, TypeOneId, TypeTwoId, GenerationId) VALUES
('Bulbasaur', 5, 8, 1),   -- Grass, Poison
('Ivysaur', 5, 8, 1),     -- Grass, Poison
('Venusaur', 5, 8, 1),    -- Grass, Poison
('Charmander', 2, NULL, 1), -- Fire
('Charmeleon', 2, NULL, 1), -- Fire
('Charizard', 2, 10, 1),  -- Fire, Flying
('Squirtle', 3, NULL, 1), -- Water
('Wartortle', 3, NULL, 1),-- Water
('Blastoise', 3, NULL, 1),-- Water
('Caterpie', 12, NULL, 1),-- Bug
('Metapod', 12, NULL, 1), -- Bug
('Butterfree', 12, 10, 1),-- Bug, Flying
('Weedle', 12, 8, 1),     -- Bug, Poison
('Kakuna', 12, 8, 1),     -- Bug, Poison
('Beedrill', 12, 8, 1),   -- Bug, Poison
('Pidgey', 1, 10, 1),     -- Normal, Flying
('Pidgeotto', 1, 10, 1),  -- Normal, Flying
('Pidgeot', 1, 10, 1),    -- Normal, Flying
('Rattata', 1, NULL, 1),  -- Normal
('Raticate', 1, NULL, 1), -- Normal
('Spearow', 1, 10, 1),    -- Normal, Flying
('Fearow', 1, 10, 1),     -- Normal, Flying
('Ekans', 8, NULL, 1),    -- Poison
('Arbok', 8, NULL, 1),    -- Poison
('Pikachu', 4, NULL, 1),  -- Electric
('Raichu', 4, NULL, 1),   -- Electric
('Sandshrew', 9, NULL, 1),-- Ground
('Sandslash', 9, NULL, 1),-- Ground
('Nidoran♀', 8, NULL, 1), -- Poison
('Nidorina', 8, NULL, 1), -- Poison
('Nidoqueen', 8, 9, 1),   -- Poison, Ground
('Nidoran♂', 8, NULL, 1), -- Poison
('Nidorino', 8, NULL, 1), -- Poison
('Nidoking', 8, 9, 1),    -- Poison, Ground
('Clefairy', 18, NULL, 1),-- Fairy
('Clefable', 18, NULL, 1),-- Fairy
('Vulpix', 2, NULL, 1),   -- Fire
('Ninetales', 2, NULL, 1),-- Fire
('Jigglypuff', 1, 18, 1), -- Normal, Fairy
('Wigglytuff', 1, 18, 1), -- Normal, Fairy
('Zubat', 8, 10, 1),      -- Poison, Flying
('Golbat', 8, 10, 1),     -- Poison, Flying
('Oddish', 5, 8, 1),      -- Grass, Poison
('Gloom', 5, 8, 1),       -- Grass, Poison
('Vileplume', 5, 8, 1),   -- Grass, Poison
('Paras', 12, 5, 1),      -- Bug, Grass
('Parasect', 12, 5, 1),   -- Bug, Grass
('Venonat', 12, 8, 1),    -- Bug, Poison
('Venomoth', 12, 8, 1),   -- Bug, Poison
('Diglett', 9, NULL, 1),  -- Ground
('Dugtrio', 9, NULL, 1),  -- Ground
('Meowth', 1, NULL, 1),   -- Normal
('Persian', 1, NULL, 1),  -- Normal
('Psyduck', 3, NULL, 1),  -- Water
('Golduck', 3, NULL, 1),  -- Water
('Mankey', 7, NULL, 1),   -- Fighting
('Primeape', 7, NULL, 1), -- Fighting
('Growlithe', 2, NULL, 1),-- Fire
('Arcanine', 2, NULL, 1), -- Fire
('Poliwag', 3, NULL, 1),  -- Water
('Poliwhirl', 3, NULL, 1),-- Water
('Poliwrath', 3, 7, 1),   -- Water, Fighting
('Abra', 11, NULL, 1),    -- Psychic
('Kadabra', 11, NULL, 1), -- Psychic
('Alakazam', 11, NULL, 1),-- Psychic
('Machop', 7, NULL, 1),   -- Fighting
('Machoke', 7, NULL, 1),  -- Fighting
('Machamp', 7, NULL, 1),  -- Fighting
('Bellsprout', 5, 8, 1),  -- Grass, Poison
('Weepinbell', 5, 8, 1),  -- Grass, Poison
('Victreebel', 5, 8, 1),  -- Grass, Poison
('Tentacool', 3, 8, 1),   -- Water, Poison
('Tentacruel', 3, 8, 1),  -- Water, Poison
('Geodude', 13, 9, 1),    -- Rock, Ground
('Graveler', 13, 9, 1),   -- Rock, Ground
('Golem', 13, 9, 1),      -- Rock, Ground
('Ponyta', 2, NULL, 1),   -- Fire
('Rapidash', 2, NULL, 1), -- Fire
('Slowpoke', 3, 11, 1),   -- Water, Psychic
('Slowbro', 3, 11, 1),    -- Water, Psychic
('Magnemite', 4, 17, 1),  -- Electric, Steel
('Magneton', 4, 17, 1),   -- Electric, Steel
('Farfetch\'d', 1, 10, 1),   -- Normal, Flying
('Doduo', 1, 10, 1),         -- Normal, Flying
('Dodrio', 1, 10, 1),        -- Normal, Flying
('Seel', 3, NULL, 1),        -- Water
('Dewgong', 3, 6, 1),        -- Water, Ice
('Grimer', 8, NULL, 1),      -- Poison
('Muk', 8, NULL, 1),         -- Poison
('Shellder', 3, NULL, 1),    -- Water
('Cloyster', 3, 6, 1),       -- Water, Ice
('Gastly', 14, 8, 1),        -- Ghost, Poison
('Haunter', 14, 8, 1),       -- Ghost, Poison
('Gengar', 14, 8, 1),        -- Ghost, Poison
('Onix', 13, 9, 1),          -- Rock, Ground
('Drowzee', 11, NULL, 1),    -- Psychic
('Hypno', 11, NULL, 1),      -- Psychic
('Krabby', 3, NULL, 1),      -- Water
('Kingler', 3, NULL, 1),     -- Water
('Voltorb', 4, NULL, 1),     -- Electric
('Electrode', 4, NULL, 1),   -- Electric
('Exeggcute', 5, 11, 1),     -- Grass, Psychic
('Exeggutor', 5, 11, 1),     -- Grass, Psychic
('Cubone', 9, NULL, 1),      -- Ground
('Marowak', 9, NULL, 1),     -- Ground
('Hitmonlee', 7, NULL, 1),   -- Fighting
('Hitmonchan', 7, NULL, 1),  -- Fighting
('Lickitung', 1, NULL, 1),   -- Normal
('Koffing', 8, NULL, 1),     -- Poison
('Weezing', 8, NULL, 1),     -- Poison
('Rhyhorn', 9, 13, 1),       -- Ground, Rock
('Rhydon', 9, 13, 1),        -- Ground, Rock
('Chansey', 1, NULL, 1),     -- Normal
('Tangela', 5, NULL, 1),     -- Grass
('Kangaskhan', 1, NULL, 1),  -- Normal
('Horsea', 3, NULL, 1),      -- Water
('Seadra', 3, NULL, 1),      -- Water
('Goldeen', 3, NULL, 1),     -- Water
('Seaking', 3, NULL, 1),     -- Water
('Staryu', 3, NULL, 1),      -- Water
('Starmie', 3, 11, 1),       -- Water, Psychic
('Mr. Mime', 11, 18, 1),     -- Psychic, Fairy
('Scyther', 12, 10, 1),      -- Bug, Flying
('Jynx', 6, 11, 1),          -- Ice, Psychic
('Electabuzz', 4, NULL, 1),  -- Electric
('Magmar', 2, NULL, 1),      -- Fire
('Pinsir', 12, NULL, 1),     -- Bug
('Tauros', 1, NULL, 1),      -- Normal
('Magikarp', 3, NULL, 1),    -- Water
('Gyarados', 3, 10, 1),      -- Water, Flying
('Lapras', 3, 6, 1),         -- Water, Ice
('Ditto', 1, NULL, 1),       -- Normal
('Eevee', 1, NULL, 1),       -- Normal
('Vaporeon', 3, NULL, 1),    -- Water
('Jolteon', 4, NULL, 1),     -- Electric
('Flareon', 2, NULL, 1),     -- Fire
('Porygon', 1, NULL, 1),     -- Normal
('Omanyte', 13, 3, 1),       -- Rock, Water
('Omastar', 13, 3, 1),       -- Rock, Water
('Kabuto', 13, 3, 1),        -- Rock, Water
('Kabutops', 13, 3, 1),      -- Rock, Water
('Aerodactyl', 13, 10, 1),   -- Rock, Flying
('Snorlax', 1, NULL, 1),     -- Normal
('Articuno', 6, 10, 1),      -- Ice, Flying
('Zapdos', 4, 10, 1),        -- Electric, Flying
('Moltres', 2, 10, 1),       -- Fire, Flying
('Dratini', 15, NULL, 1),    -- Dragon
('Dragonair', 15, NULL, 1),  -- Dragon
('Dragonite', 15, 10, 1),    -- Dragon, Flying
('Mewtwo', 11, NULL, 1),     -- Psychic
('Mew', 11, NULL, 1),        -- Psychic
('Chikorita', 5, NULL, 2),     -- Grass
('Bayleef', 5, NULL, 2),       -- Grass
('Meganium', 5, NULL, 2),      -- Grass
('Cyndaquil', 2, NULL, 2),     -- Fire
('Quilava', 2, NULL, 2),       -- Fire
('Typhlosion', 2, NULL, 2),    -- Fire
('Totodile', 3, NULL, 2),      -- Water
('Croconaw', 3, NULL, 2),      -- Water
('Feraligatr', 3, NULL, 2),    -- Water
('Sentret', 1, NULL, 2),       -- Normal
('Furret', 1, NULL, 2),        -- Normal
('Hoothoot', 1, 10, 2),        -- Normal, Flying
('Noctowl', 1, 10, 2),         -- Normal, Flying
('Ledyba', 12, 10, 2),         -- Bug, Flying
('Ledian', 12, 10, 2),         -- Bug, Flying
('Spinarak', 12, 8, 2),        -- Bug, Poison
('Ariados', 12, 8, 2),         -- Bug, Poison
('Crobat', 8, 10, 2),          -- Poison, Flying
('Chinchou', 3, 4, 2),         -- Water, Electric
('Lanturn', 3, 4, 2),          -- Water, Electric
('Pichu', 4, NULL, 2),         -- Electric
('Cleffa', 18, NULL, 2),       -- Fairy
('Igglybuff', 1, 18, 2),       -- Normal, Fairy
('Togepi', 18, NULL, 2),       -- Fairy
('Togetic', 18, 10, 2),        -- Fairy, Flying
('Natu', 11, 10, 2),           -- Psychic, Flying
('Xatu', 11, 10, 2),           -- Psychic, Flying
('Mareep', 4, NULL, 2),        -- Electric
('Flaaffy', 4, NULL, 2),       -- Electric
('Ampharos', 4, NULL, 2),      -- Electric
('Bellossom', 5, NULL, 2),     -- Grass
('Marill', 3, 18, 2),          -- Water, Fairy
('Azumarill', 3, 18, 2),       -- Water, Fairy
('Sudowoodo', 13, NULL, 2),    -- Rock
('Politoed', 3, NULL, 2),      -- Water
('Hoppip', 5, 10, 2),          -- Grass, Flying
('Skiploom', 5, 10, 2),        -- Grass, Flying
('Jumpluff', 5, 10, 2),        -- Grass, Flying
('Aipom', 1, NULL, 2),         -- Normal
('Sunkern', 5, NULL, 2),       -- Grass
('Sunflora', 5, NULL, 2),      -- Grass
('Yanma', 12, 10, 2),          -- Bug, Flying
('Wooper', 3, 9, 2),           -- Water, Ground
('Quagsire', 3, 9, 2),         -- Water, Ground
('Espeon', 11, NULL, 2),       -- Psychic
('Umbreon', 16, NULL, 2),      -- Dark
('Murkrow', 16, 10, 2),        -- Dark, Flying
('Slowking', 3, 11, 2),        -- Water, Psychic
('Misdreavus', 14, NULL, 2),   -- Ghost
('Unown', 11, NULL, 2),        -- Psychic
('Wobbuffet', 11, NULL, 2),    -- Psychic
('Girafarig', 1, 11, 2),       -- Normal, Psychic
('Pineco', 12, NULL, 2),       -- Bug
('Forretress', 12, 17, 2),     -- Bug, Steel
('Dunsparce', 1, NULL, 2),     -- Normal
('Gligar', 9, 10, 2),          -- Ground, Flying
('Steelix', 17, 9, 2),         -- Steel, Ground
('Snubbull', 18, NULL, 2),     -- Fairy
('Granbull', 18, NULL, 2),     -- Fairy
('Qwilfish', 3, 8, 2),         -- Water, Poison
('Scizor', 12, 17, 2),         -- Bug, Steel
('Shuckle', 12, 13, 2),        -- Bug, Rock
('Heracross', 12, 7, 2),       -- Bug, Fighting
('Sneasel', 16, 6, 2),         -- Dark, Ice
('Teddiursa', 1, NULL, 2),     -- Normal
('Ursaring', 1, NULL, 2),      -- Normal
('Slugma', 2, NULL, 2),        -- Fire
('Magcargo', 2, 13, 2),        -- Fire, Rock
('Swinub', 6, 9, 2),           -- Ice, Ground
('Piloswine', 6, 9, 2),        -- Ice, Ground
('Corsola', 3, 13, 2),         -- Water, Rock
('Remoraid', 3, NULL, 2),      -- Water
('Octillery', 3, NULL, 2),     -- Water
('Delibird', 6, 10, 2),        -- Ice, Flying
('Mantine', 3, 10, 2),         -- Water, Flying
('Skarmory', 17, 10, 2),       -- Steel, Flying
('Houndour', 16, 2, 2),        -- Dark, Fire
('Houndoom', 16, 2, 2),        -- Dark, Fire
('Kingdra', 3, 15, 2),         -- Water, Dragon
('Phanpy', 9, NULL, 2),        -- Ground
('Donphan', 9, NULL, 2),       -- Ground
('Porygon2', 1, NULL, 2),        -- Normal
('Stantler', 1, NULL, 2),        -- Normal
('Smeargle', 1, NULL, 2),        -- Normal
('Tyrogue', 7, NULL, 2),         -- Fighting
('Hitmontop', 7, NULL, 2),       -- Fighting
('Smoochum', 6, 11, 2),          -- Ice, Psychic
('Elekid', 4, NULL, 2),          -- Electric
('Magby', 2, NULL, 2),           -- Fire
('Miltank', 1, NULL, 2),         -- Normal
('Blissey', 1, NULL, 2),         -- Normal
('Raikou', 4, NULL, 2),          -- Electric
('Entei', 2, NULL, 2),           -- Fire
('Suicune', 3, NULL, 2),         -- Water
('Larvitar', 15, 9, 2),          -- Rock, Ground
('Pupitar', 15, 9, 2),           -- Rock, Ground
('Tyranitar', 15, 16, 2),        -- Rock, Dark
('Lugia', 11, 10, 2),            -- Psychic, Flying
('Ho-Oh', 2, 10, 2),             -- Fire, Flying
('Celebi', 5, 11, 2);            -- Grass, Psychic

INSERT INTO TypeInteraction (StrongType, WeakType) VALUES
-- Fire
(2, 5),   -- Fire > Grass
(2, 6),   -- Fire > Ice
(2, 12),  -- Fire > Bug
(2, 17),  -- Fire > Steel

-- Water
(3, 2),   -- Water > Fire
(3, 9),   -- Water > Ground
(3, 13),  -- Water > Rock

-- Electric
(4, 3),   -- Electric > Water
(4, 10),  -- Electric > Flying

-- Grass
(5, 3),   -- Grass > Water
(5, 9),   -- Grass > Ground
(5, 13),  -- Grass > Rock

-- Ice
(6, 5),   -- Ice > Grass
(6, 10),  -- Ice > Flying
(6, 15),  -- Ice > Dragon
(6, 9),   -- Ice > Ground

-- Fighting
(7, 1),   -- Fighting > Normal
(7, 6),   -- Fighting > Ice
(7, 13),  -- Fighting > Rock
(7, 16),  -- Fighting > Dark
(7, 17),  -- Fighting > Steel

-- Poison
(8, 5),   -- Poison > Grass
(8, 18),  -- Poison > Fairy

-- Ground
(9, 2),   -- Ground > Fire
(9, 4),   -- Ground > Electric
(9, 8),   -- Ground > Poison
(9, 13),  -- Ground > Rock
(9, 17),  -- Ground > Steel

-- Flying
(10, 5),  -- Flying > Grass
(10, 7),  -- Flying > Fighting
(10, 12), -- Flying > Bug

-- Psychic
(11, 7),  -- Psychic > Fighting
(11, 8),  -- Psychic > Poison

-- Bug
(12, 5),  -- Bug > Grass
(12, 11), -- Bug > Psychic
(12, 16), -- Bug > Dark

-- Rock
(13, 2),  -- Rock > Fire
(13, 6),  -- Rock > Ice
(13, 10), -- Rock > Flying
(13, 12), -- Rock > Bug

-- Ghost
(14, 11), -- Ghost > Psychic
(14, 14), -- Ghost > Ghost

-- Dragon
(15, 15), -- Dragon > Dragon

-- Dark
(16, 11), -- Dark > Psychic
(16, 14), -- Dark > Ghost

-- Steel
(17, 6),  -- Steel > Ice
(17, 15), -- Steel > Dragon
(17, 18), -- Steel > Fairy

-- Fairy
(18, 7),  -- Fairy > Fighting
(18, 14), -- Fairy > Ghost
(18, 15); -- Fairy > Dragon

INSERT INTO Collection (PokemonId, NumberCaught)
SELECT Id, 0 FROM Pokemon;
