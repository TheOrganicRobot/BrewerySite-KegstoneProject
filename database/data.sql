-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

-- INSERT statements go here

INSERT INTO brewery (breweryname, address1, city, district, postalcode, country, phonenumber, webaddress, imagepath, brewerydescription)
VALUES ('Seventh Son Brewing', '1101 N. 4th. St.', 'Columbus', 'Ohio', '43201', 'USA', '(614)421-2337', 'http://www.seventhsonbrewing.com/', 'img/Seventh Son/7TH_logo.jpg', '7th Son Brewing has been producing exceptional beers at the intersection of 4th & 4th in Columbus'' historic Italian Village since April of 2013.');

INSERT INTO brewery (breweryname, address1, city, district, postalcode, country, phonenumber, webaddress, imagepath, brewerydescription)
VALUES ('Lagunitas', '1280 N. McDowell Blvd.', 'Petaluma', 'California', '94954', 'USA', '(707)769-4495', 'https://lagunitas.com/', 'img/Lagunitas/LAG_logo.jpg', 'Starting as a stove top brew kit in Northern California in 1993 and growing into two distribution facilities, distributing to 20+ countries around the world, Lagunitas quickly became a staple in the craft beer community.');

INSERT INTO brewery (breweryname, address1, city, district, postalcode, country, phonenumber, webaddress, imagepath, brewerydescription)
VALUES ('Unibroue', '3765 Rodeo Dr.', 'Granbury', 'Texas', '74573','USA', '(450)658-7658', 'https://www.unibroue.com/en/legal', 'img/Unibroue/UNI_logo.jpg', 'Unibroue makes a wide range of beers, although there is a focus on Belgian-style brews. Most of Unibroue''s beers are bottled "on the lees", or containing yeast sediment (or lees). This practice provides additional fermentation, also called bottle-conditioned, after bottling.');

-- INSERT INTO brewery (breweryname, address1, city, district, postalcode, country, phonenumber, webaddress, imagepath, brewerydescription)
-- VALUES ('Weihenstephan', '7767 Doodad St.', 'Freising', 'Wyoming', '85354', 'USA', '(498)161-5360', 'https://www.weihenstephaner.de/en/', 'img/Weihenstephan/WEIH_logo.jpg', 'Single handedly the world''s oldest brewery! In production since the year 1040 A.D., Weihenstephan has been defining the nature of brewing for almost a thousand years! Operating under German purity laws, consistency and perfection are key in defining this age old tradition.');

INSERT INTO brewery (breweryname, address1, city, district, postalcode, country, phonenumber, webaddress, imagepath, brewerydescription)
VALUES ('Brouwerij Van Steenberge', '2576 Linden Ln.', 'Las Vegas', 'Nevada', '99404', 'USA', '(473)345-4454', 'https://www.vansteenberge.com/', 'img/VanSteenberge/VAN_logo.jpg', 'The Brouwerij Van Steenberge brewery stands for independence, progress and growth. We emphasise the traditional art of brewing adapted to the current technological evolution and we guarantee a reliable quality and service.');


------------BEERS-----------

INSERT INTO beer (brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)
VALUES (1, 'Seventh Son Strong Ale', 'Strong Ale', '7.70%', 'Tangy and malty with tobacco, toffee and lots of pine', 'Pours deep red - brown with a small beige head', 'Fresh, sweet, sticky, toffee, caramel, juicy, tangy, citrus fruit, resin and candy', 'A ruddy amber American Strong Ale. Grapefruit and stone fruit hop aroma and character are balanced by a rich red malt backbone.', 'img/Seventh%20Son/7TH_seventh_son.jpg');

INSERT INTO beer (brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)
VALUES (1, 'Proliferous', 'American Imperial IPA', '8.20%', 'Nice mix of hops and malt. Semi-sweet with a lightly sour, dry finish.', 'Clear, light orange color.', 'Fruity, spicy hops. Some malt sweetness, faint smell of dankness.', 'Mosaic and a cast of supporting hops give this DIPA layers of tropical fruit and citrus with a bracing pine bitterness in the finish.', 'img/Seventh%20Son/7TH_proliferous.jpg');

INSERT INTO beer (brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)
VALUES (1, 'Humulus Nimbus', 'American Pale Ale', '6.00%', 'Clean flavor, with clean hop presence, and a touch of sweet malt.', 'Pours a clear golden with a full white head.', 'Bright tropical fruit aroma, with hints of mango and pineapple.', 'A pale golden ale that is both super crisp and super hop forward with a refreshing mouthfeel and a summer friendly 6% abv.', 'img/Seventh%20Son/7TH_humulus.jpg');

INSERT INTO beer (brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)
VALUES (1, 'Syzygy', 'American Imperial IPA', '10.9%', 'Big pine needle hops. A touch of sweetness. A touch of funk. A bit of apricot.', 'Amber hue, passes some light.', 'Big pine needle hops. A touch of sweetness, a touch of funk, and a bit of apricot.', 'An astronomical alignment of hop bitterness, flavor and aroma converging on your mouth, leaving your head in the stars.', 'img/Seventh%20Son/7TH_syzygy.jpg');

INSERT INTO beer (brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)
VALUES (1, 'Oubliette', 'Imperial Stout', '12.0%', 'Rich flavors of chocolate-covered raisins and faint char roll into a warming alcohol presence and lingering bitterness.', 'Pours dark black with some tan foam.', 'Cacao and espresso aromas give way to berries and dried stonefruit.', 'Derived from the French word for forgetting, our Oubliette Imperial Stout is as black as the dungeon that shares its name.', 'img/Seventh%20Son/7TH_oubliette.jpg');

INSERT INTO beer (brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)
VALUES (2, 'Lagunitas Sucks', 'American Strong Ale', '7.50%', 'Taste is the similar (although weaker) but with additional notes of grains, sweet white bread and sugar.', 'Semi-clear, golden colored beer.', 'Aroma is grapefruit, pine, slight dishcloth, mango, satsumas, lime and unripe pineapple.', 'AKA Brown Sugar Substitute. This sad holiday season we didn''t have the brewing capacity to make our favorite seasonal brew, the widely feared BrownShugga'' Ale, soo... we suck... and made this instead.', 'img/Lagunitas/LAG_sucks.jpg');

INSERT INTO beer (brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)
VALUES (2, 'Little Sumpin'' Sumpin''', 'American Pale Wheat Ale', '8.00%', 'This beer is maltier than some crisp IPAs. Slightly bitter with a tart after-taste and a hint of wheat.', 'Golden straw color with creamy head.', 'Pine and grass, wood, fermentation, yeast.', 'Way smooth and silky with a nice wheaty-esque-ish-ness. Just the little sumpin'' sumpin'' we all need to kick Summer into full swing!', 'img/Lagunitas/LAG_littlesumpin.jpg');

INSERT INTO beer (brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)
VALUES (2, 'Hop Stoopid', 'American Imperial IPA', '8.00%', 'Classic west coast style resiny hop notes, candied orange and lemon rind, slightly caramelized malt and lingering hop bitterness on the finish.', 'Clear deep golden color with off-white head.', 'Aroma has deep hop resin notes with orange rind and biscuity malts.', 'For those mornings when you have to cut right to the chase, this is the one. Sure to blast through just about anything still lingering from the night before, this mouthful of Hops and huge rich Malt has a guarantee built right into the name!', 'img/Lagunitas/LAG_stoopid.jpg');

INSERT INTO beer (brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)
VALUES (2, 'Aunt Sally', 'Sour/Wild Ale', '5.70%', 'Citric, fruity, refreshing, slightly acidic and a mineral touch.', 'Hazy orange golden body with a lacing, creamy white head.', 'Citric, mildly acidic, slightly mineral and just a faint hint of yogurt.', 'It tastes like a big bowl of fruity candy or some chewable flavored vitamins, but what''s the difference? It''s sweet, tart, and sassy, just like the tasty cherry pie that your favorite aunt makes.', 'img/Lagunitas/LAG_sally.jpg');

INSERT INTO beer (brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)
VALUES (2, 'Maximus', 'Double IPA', '8.20%', 'Oranges, grapefruits, red fruits, floral, sugar, spices, strong pine, strong resins, herbs, biscuits, strong lemon and strong bitter grassy hops.', 'Reddish, golden slightly cloudy pour with moderately thin foam.', 'Grassy with some citrus and spice on the edge and some caramel malt.', 'At the height of the heat in the heart of the summer, we felt that the only cure was a raging mouthful of fresh hops and malt. Caution: May remove enamel from teeth.', 'img/Lagunitas/LAG_maximus.jpg');

INSERT INTO beer (brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)
VALUES (3, 'La Fin Du Monde', 'Abbey Tripel', '9.00%', 'Fruitiness, like apples, pears, some banana, corriander.', 'Opaque honey amber, gargantuan off-white head.', 'Yeasty with notes of Belgian spices, clove, and dried fruits.', 'La Fin du Monde was developed through 18 months of research on a unique strain of yeast originating from Europe. It is brewed in honor of the intrepid European explorers who believed they had reached the "end of the world" when they discovered North America "the new world". This triple-style golden ale recreates the style of beer originally developed in the Middle Ages by trappist monks for special occasions and as such it was the first of its kind to be brewed in North America.', 'img/Unibroue/UNI_monde.jpg');

INSERT INTO beer (brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)
VALUES (3, 'Trois Pistoles', 'Abbey Quadrupel', '9.00%', 'Quite sweet up front with Raisins, black cherry, plum & brown sugar bringing a delicious decadent yet balanced flavor.', 'Opaque deep red/brown with an expectedly big fluffy head.', 'Dark Belgian yeast and warm stone fruit.', 'Drawing on Quebec folklore, Unibroue chose the name Trois Pistoles to honour the city''s historic importance and pay homage to the legend of the Black Horse. Conjured up by a priest to help build a new church, this incarnation of the devil ran off when its bridle was removed. Because construction was still underway when the horse vanished, a stone remains missing from the church to this day.', 'img/Unibroue/UNI_pistoles.jpg');

INSERT INTO beer (brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)
VALUES (3, 'Maudite', 'Abbey Dubel', '8.00%', 'Semisweet caramel bread, date and plum mixed together with a dry, peppery & very mild clove finish.', 'Dark amber to light brown with orange highlights.', 'Burnt sugar caramel with some bready malt and plum notes.', 'Without a doubt Unibroue''s best-known beer, La Maudite is inspired by abbey beers and Belgian double-style ales. It first hit the shelves in 1992 and took the province by storm with its 8% alcohol content, making it the first strong beer available in grocery stores. That''s where the idea came to tie its name and branding to a pact signed with the devil. The illustration of the "chasse-galerie" (or flying canoe) from a beloved Quebec legend captures the spirit of the beer.', 'img/Unibroue/UNI_maudite.jpg');

INSERT INTO beer (brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)
VALUES (3, 'Don de Dieu', 'Belgian Strong Pale Ale', '9.00%', 'Sweet Belgian yeast, light Belgian candy sugar and pale malt.', 'Copper colored and hazy.', 'Pale wheat and sweet, light Belgian yeast with a hint of apples, caramel, and spices.', 'Don de Dieu (Gift of God) was the name of the ship that Samuel de Champlain sailed on his mission to "explore and discover the vast and perilous land of America" in the name of the King of France. His travels led to the founding of Quebec City in 1608. Inspired by this great adventure, Unibroue created Don de Dieu-an abbey-style triple wheat beer refermented in the bottle. Soft and round, it has delicately nuanced fruity and hoppy notes.', 'img/Unibroue/UNI_don.jpg');

INSERT INTO beer (brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)
VALUES (3, 'Blanche de Chambly', 'Belgian Witbier', '5.00%', 'Sweet orange and lemon zest, coriander and yeast.', 'Murky gold with few bubble streams.', 'Coriander, orange peel and banana nut bread.', 'The Blanche de Chambly label features the icon of the city where it is brewed: Fort Chambly. It was converted from a wooden barricade used for fighting against the Iroquois in the middle of the XVII century into a stone fortress to combat the British army at the beginning of the XVIII century. With notes of dried orange peel and coriander seeds, this brew is a worthy representative of classic Belgian-style white wheat beers.', 'img/Unibroue/UNI_blanche.jpg');

INSERT INTO beer (brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)
VALUES (4, 'Baptist', 'Belgian Ale', '5.2%', 'Medium sweet with an above moderate bitterness.', 'Gold blond colored body with a white head.', 'Floral and a bit grassy with a soapy element, spicy yeast, grainy malt.', 'Baptist is a flavoursome tribute to our founder and is brewed on the occasion of the opening of our own Bar Baptist. The result is an accessible craft beer with a full and rich flavour. Beers brewed with modern techniques and with respect for our rich history. A recipe that Jan Baptist would rightly be proud of.', 'img/VanSteenberge/VAN_baptist.jpg');

INSERT INTO beer (brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)
VALUES (4, 'Bornem', 'Belgian Dubbel', '8.0%', 'Lightly caramel malt, figs, dates, raisins, light stone fruit and a little clove and wet cardboard.', 'Hazy, slightly reddish orange with a two finger light khaki head.', 'Molasses and candy pear.', 'Bornem living abbey beer is inextricably linked to the Sint-Bernardus abbey in Bornem. It has carried the Recognized Belgian Abbey Beer label since 1999.', 'img/VanSteenberge/VAN_bornem.jpg');

INSERT INTO beer (brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)
VALUES (4, 'Gulden Draak', 'Belgian Strong Ale', '10.5%', 'Moderately sweet with notes of caramel with a little chocolate, malt, and some earthy notes.', 'Pours ruby with a big off-white head.', 'Cloves, red fruits, cherry, Christmas cake, currants.', 'Gulden Draak is a high fermentation beer with secondary fermentation. For the secondary fermentation, wine yeast is used. The white bottle, the black banner, the golden dragon and the red letters, constitute a stylish result that has no equal among the many Belgian special beers.', 'img/VanSteenberge/VAN_draak.jpg');

INSERT INTO beer (brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)
VALUES (4, 'Monk''s Cafe Flemish Sour Ale', 'Flanders Oud Bruin', '5.5%', 'Tart, with a malty sweetness anchoring all the cherries and raspberries.', 'Clear, dark brownsih red with soft, frothy head.', 'Sweet and sour with notes of grass, cherries and a little bit raspberry.', 'When Jan Baptist De Bruyne expanded his agricultural activities to include beer brewing in 1784, the Van Steenberge brewery was born. The first beer Jan Baptist developed was an old brown stored in oak casks and distributed to local, private pubs. The brewery was named ''De Peer'' because of the beers'' typical fruity aroma.', 'img/VanSteenberge/VAN_monks.jpg');

INSERT INTO beer (brewery_id, beername, beertype, abv, flavor, color, aroma, beerdescription, imagepath)
VALUES (4, 'Piraat', 'Belgian Strong Pale Ale', '10.5%', 'Sweet, either caramel or molasses, cherries, pomegranate, and vanilla.', 'Opaque burnt orange with an impressive head.', 'Combination of a fruity red wine and malted barley.', 'The Van Steenberge brewery created Piraat in 1988 in the wake of the success of its Gulden Draak. Jozef Van Steenberge used the same unique wine yeasts as in Gulden Draak to create a unique, excellent amber beer.', 'img/VanSteenberge/VAN_piraat.jpg');

--------ADMIN AND USERS-------

INSERT INTO app_user (user_name, password, role, salt)
VALUES ('admin', 'zC2sh/9IpHtNHJ+nvNdzbQ==', 'admin', 'lRQByiJqPXa232fhZWDRRkuqhzG8pzwODG4Yo7Umw1dHBZ2zZpnMdhzOlfeSxgQgakf92IjzAjwQHp2oOv4lKQ7QeI1Zx48NL8YePJ0x/Zv65inaXp7AzeAflfB8roKhXyUtjlLK6Zb5KwgTW+jQJ+fhImBP6sIvO5xP+e53jzo=');

INSERT INTO app_user (user_name, password, role, salt)
VALUES ('Steenberge', 'lZuyC22AgSjL2oY6wsaLyw==', 'brewer', 'N4YimO5XCrJygkLOfS5pFREt3mnD/yjUxoS63D4o5JOeexpcLiyQ+sNBrPgiWxlfbsZV38T6kDZf88ik17r5WY5HewgDfKU/vm/MLyPZPyX9pt63nvaZiyqdAbfqV69/kugXtTrupzRuP6lljFyW5xTPDGB2XCdMbdUEW9Emobk=');

INSERT INTO app_user (user_name, password, role, salt)
VALUES ('Lagunitas', 'wO/ae62RdU7lFdUQlb5eBQ==', 'brewer', 'MClZ0w1WW+lt6gweTxdXr6IALSEMuZkuQrC45qCnirHnxxePQcyF7XCIENmqcuomVVl+50ZUDsIYw8tc5oiACYNOIOnFtEslKyM6ELUWq776nOFh86tO9h+4++8wJdKGtZ3flFElhk1ePRNfriKI+Qh8hY5EOAC60MOZFcVFBVw=');

INSERT INTO app_user (user_name, password, role, salt)
VALUES ('Seventh', 'T4+by5BUEMq1l3QMRIdfTA==', 'brewer', '0BjrI837b05DAyfBVBBjT5lDe79Hzx7ZoKriXRZKpGpKyBj7Jvhmy4GfT4H/2P623hWB2K9QH2fAubwTb2Pi7UKHI9gRpkkd0/zQ0Icw1m/rCYGwiI1fQqesKASB3AHsBZPvltJ6cLz9F/LhbuRnrEAGK6IFCXAmMrfiCUhDzGQ=');

INSERT INTO app_user (user_name, password, role, salt)
VALUES ('Unibroue', '3WVvkRCOOjE/DwoFwdrGbw==', 'brewer', '7fLgK+y5JFXmIZbwUVOpNBcrriR6FzjjNosIDhxdp+ScYmRq2sDprj2ngqrPOKgOD7qODyGcN7w1YU2BqHZvLETawZt5Y+MFimnnyxz+IvFBUFpg9mTcUIwjAjL8x85wN/3fxuLHmC9wvkeFRsFP+OjThBwsOt+hxgzsihMnhj8=');

---------ASSOCIATIVE TABLE FOR BREWERY/USER-ID--------

INSERT INTO brewery_user (brewery_id, user_id)
VALUES (1, 4);

INSERT INTO brewery_user (brewery_id, user_id)
VALUES (2, 3);

INSERT INTO brewery_user (brewery_id, user_id)
VALUES (3, 5);

INSERT INTO brewery_user (brewery_id, user_id)
VALUES (4, 2);


--------------------Beer Reviews--------------------
INSERT INTO review (review_id, beer_id, username, title, review, rating, review_date)
VALUES(99, 4, 'JohnCena' , 'WHAT A DRINK, DO YOURSELF A FAVOR AND TRY IT', 'Bright lemon and Lacto presence is balanced by a tannic and earthy presence. Good attenuation and carbonation contribute to a classic Belgian digestibility. Brett funk is present, and it''s not just a Lacto bomb. Complex. Lemonhead candy with restrained sweetness.' ,5, '2018-12-12');

INSERT INTO review (review_id, beer_id, username, title, review, rating, review_date)
VALUES(95, 2, 'BILLNYETHESCIENCEGUY' , 'IT TASTE LIKE MOP WATER', 'Even the most hyped breweries aren''t immune from producing bad beer (Trillium and Monkish came together to burn throats with Never & Again; Tired Hands attempted the same with Mago Tago.) This recent release was brewed exclusively with New Zealand Wai-iti hops. Well, no disrespect to the country that brought us Flight of the Conchords and Middle Earth, but the end result turned out to be a total misfire. As Untappd user dukeblueman86 succinctly put it, “Should be renamed ‘That Fart.' ,1, '2018-11-11');

INSERT INTO review (review_id, beer_id, username, title, review, rating, review_date)
VALUES(92, 1, 'SlimShadey' , 'GREAT FOR GAME NIGHT WITH THE BOYS', 'On tap at Threes in Brooklyn.Pours a clear yellow with fine, soft foam.Smell is clean and bready with a hint of tartness and citrus.Taste starts clean, crisp and bready with a hint of mineral. Hot on the heels comes a slight tartness along with notes of lime, grass and hints of yeast. A soft bitterness closes out a very refreshing flavor. Mouthfeel is thin to medium, well carbonated. Overall, a terrific and unique pilsner, very well made.' ,4, '2018-11-11');

INSERT INTO review (review_id, beer_id, username, title, review, rating, review_date)
VALUES(91, 3, 'MichaelScottDunderMifflin' , 'Best Drink EVAAAAAAR', 'Very juicy hops flavor with a mix of tropical and citrus. Moderately low sweetness with moderately high sour that fades into a dry finish. The body supports the beer with a malt character that seems a bit toothier than others in the category. Light Brett funk and tart. Lingering aftertaste of sweet fruit balanced with light tartness. Acidity is masterful placed to accentuate the fruit flavors from the hops.' ,5, '2018-10-10');

INSERT INTO review (review_id, beer_id, username, title, review, rating, review_date)
VALUES(90, 2, 'BenWyatt' , 'Not great, Steer Clear', 'I appreciate the originality of aging an IPA on white oak, however, this is just a bad-tasting beer. The hop character has significantly faded, and the palette is overrun by a distracting taste of herbs and ashes. The flavor I was most reminded of was pickle juice as it''s not so much bitter as it is salty. The white oak imparts the taste of a hot southern swamp in July. If I pay attention, I can detect some malty sweetness, but it doesn''t make up for the damage done. I''m not sure what the brewers'' intentions were with this, and I certainly don''t understand the rave reviews. I doubt it''s an old bottle, I just don''t think this beer is for me.' ,2 , '2018-9-10');

INSERT INTO review (review_id, beer_id, username, title, review, rating, review_date)
VALUES(88 , 1 , 'Mr.SquarePants' , 'Taste like Heaven in a bottle', 'Good flavor of tart lemon without the bracing acidity of others in the category. Light fruity hops. Very dry finish. Subtle funk. Good malt character that doesn''t get lost under the fruit notes from the fermentation and hops. Light lemon crispness with the right balance of complexity and acidity.' , 5 , '2018-12-11');

INSERT INTO review (review_id, beer_id, username, title, review, rating, review_date)
VALUES(87 , 1 , 'LizLemon' , 'Taste like Heaven in a bottle', 'Tastes as if someone tried to make a tea by steeping a sharpie marker in cough medicine. All I know is that this beer needs to be recalled, now some might say that I am being overly dramatic, but let me tell you, we live in the U S OF A and I have a right to vote my opinion to you kind and civil beer lovin civilian.' , 1 , '2018-12-07');

INSERT INTO review (review_id, beer_id, username, title, review, rating, review_date)
VALUES(86 , 1 , 'DEADPOOL' , 'MEH', 'Here''s the thing, Life is an endless series of train wrecks with only brief commercial-like breaks of happiness. This had been the ultimate commercial break. Which meant it was time to return to our regularly scheduled programming. And in this life all I am asking for is a decent brew.' , 2 , '2018-12-05');

INSERT INTO review (review_id, beer_id, username, title, review, rating, review_date)
VALUES(84 , 2 , 'TONYTHETIGER' , 'ITS GREATTTTT', 'The blend of phenolics and herbs carries into the palate. Also, a strong smoky and salty character gives the impression of meat. Nice spiced malt sweetness with rye notes that dries out quickly, leaving one to break down the lingering flavors of olive pit, peppercorns, mushroom, umami. Finishes fairly dry and slightly bitter.' , 5 , '2018-12-05');

INSERT INTO review (review_id, beer_id, username, title, review, rating, review_date)
VALUES(44 , 6 , 'TechEscalator' , 'IM ALL THE WAY UP NOTHIN CAN STOP ME', 'The blend of alcohols and liquids carries into the palate that is oh so great. Also a strong smell and sweet character gives the impression of sugar cookies and scotch. Nice spiced malt sweetness with butter notes that is moist leaving one to break down the lingering flavors of a cherry pit, cinnamon, salt, carmel. Finishes fairly wet and slightly sweet.' , 5 , '2018-12-05');

INSERT INTO review (review_id, beer_id, username, title, review, rating, review_date)
VALUES(83 , 15 , 'DexterMorgan' ,'GOSH THIS IS GOOD', 'The blend of phenolics and herbs carries into the palate. Also, a strong smoky and salty character gives the impression of meat. Nice spiced malt sweetness with rye notes that dries out quickly, leaving one to break down the lingering flavors of olive pit, peppercorns, mushroom, umami. Finishes fairly dry and slightly bitter.' , 5 , '2018-12-05');


INSERT INTO review (review_id, beer_id, username, title, review, rating, review_date)
VALUES(82 , 16 , 'MR.KRABS' ,'MM MM good....', 'Delicate and bright. There is a light sweetness that carries throughout the taste, then fades into low bitterness and low acidity. Citrus, perfume, and spice with bready malt. Definite Brett character, but enough residual malt that it’s a nice accent. Well-balanced.' , 4 , '2018-12-05');

INSERT INTO review (review_id, beer_id, username, title, review, rating, review_date)
VALUES(81 , 17 , 'TedMosby' ,'MM MM good....', 'to be honest, it was not that great, the tarty flavor was a suprise and I enjoyed it at first but then you get a very sweet after taste which I was not expecting. Better just stay clear of this one' , 2 , '2018-12-05');

COMMIT;