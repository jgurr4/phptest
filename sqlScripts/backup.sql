-- MySQL dump 10.13  Distrib 8.0.0-dmr, for Linux (x86_64)
--
-- Host: localhost    Database: phptest
-- ------------------------------------------------------
-- Server version	8.0.0-dmr

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `source`
--

DROP TABLE IF EXISTS `source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source` (
  `method_id` int(10) unsigned DEFAULT NULL,
  `source1` text NOT NULL,
  `source2` text,
  `source3` text,
  `source4` text,
  `source5` text,
  `extraInfo` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source`
--

LOCK TABLES `source` WRITE;
/*!40000 ALTER TABLE `source` DISABLE KEYS */;
/*!40000 ALTER TABLE `source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supply`
--

DROP TABLE IF EXISTS `supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `base_material` varchar(50) NOT NULL,
  `secondary_material` varchar(50) DEFAULT NULL,
  `description` text,
  `common` enum('Y','N') DEFAULT 'N',
  `howToGet` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supply`
--

LOCK TABLES `supply` WRITE;
/*!40000 ALTER TABLE `supply` DISABLE KEYS */;
/*!40000 ALTER TABLE `supply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `tech` varchar(150) NOT NULL,
  `survival` tinyint(1) NOT NULL,
  `city` tinyint(1) NOT NULL,
  `homestead` tinyint(1) NOT NULL,
  `tOrder` int(10) unsigned DEFAULT NULL,
  `tGroup` varchar(40) DEFAULT NULL,
  `user_author` varchar(40) DEFAULT 'TheGuy',
  `purpose` text,
  `instructions` text,
  `image` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `tGroup` (`tGroup`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,' Shaping Stone',' foraging',1,1,1,1,NULL,' TheGuy',' Any type of stone that can be shaped through knapping or wetstone grinding. Useful to create your first woodcutting and woodshaping tools.',' Look for any type of stone that can be shaped through knapping or wetstone grinding.','shapedStone.png'),(2,' Stone Axehead',' primitive stoneworking',1,1,1,2,NULL,' TheGuy',' First woodcutting tool for small branches.',' Find shaping stone material, then grind against a wet stone to prevent toxic dust getting into air and lungs. Keep grinding until the stone is the correct shape you want for a axehead.','stoneAxehead.png'),(3,' Wooden Branch Mallet',' primitive woodworking',1,1,1,3,NULL,' TheGuy',' Simply a heavy stick used in combination with stone tools to shape wood. Also can later be attached to stone axehead to make a stone axe.',' Use stone axehead to chop a branch that is at least 2 inches wide from a tree, once you cut halfway try to snap with your strength and bodyweight leverage.',' null'),(4,' Plant Cordage',' foraging',1,1,1,4,NULL,' TheGuy',' Plant-based cord or rope. Generally useful for many things, but will immediately be useful to make stone axehead.',' You can use tall grass or vines or even the skin of certain plants and wind it using the ropemaking technique.',' null'),(5,' Sap',' foraging',1,1,1,5,NULL,' TheGuy',' A primitive type of glue, which is useful for many things, but will immediately be useful for making a stone axe.',' null',' null'),(6,' Stone Axe',' primitive woodworking',1,1,1,6,NULL,' TheGuy',' Your first serious woodcutting tool. It will allow you to chop logs of up to 8 inches thick with reasonable speed.',' null',' null'),(7,' Spear',' primitive woodworking',1,1,1,7,'primitive weapon',' TheGuy',' A useful hunting weapon. Can be modified to work as a Atlatl if you want.',' Chop a round straight branch of whatever width and height you feel is correct for your use. Use stone axe or chisels to scrape knobs and bumbs off the branch to make a more smooth surfaced rod. Attach a stone spearhead if you decide to make one with lashing and sap glue.',' null'),(8,' Atlatl',' primitive woodworking',1,1,1,7,'primitive weapon',' TheGuy',' A spear/javelin throwing tool used to get greater range than normal spear throwing.',' null',' null'),(9,' Primitive Bow and Arrows',' primitive woodworking',1,1,1,7,'primitive weapon',' TheGuy',' A nice ranged weapon for hunting.',' null',' null'),(10,' Club',' primitive woodworking',1,1,1,7,'primitive weapon',' TheGuy',' A useful self defense weapon',' null',' null'),(11,' Staff',' primitive woodworking',1,1,1,7,'primitive weapon',' TheGuy',' Not only a useful support for long walks/hikes, but also a great self defense weapon, especially against wolves.',' null',' null'),(12,' Stone Chisel',' primitive stoneworking',1,1,1,8,NULL,' TheGuy',' If you plan on doing more woodworking, this is a essential tool. In combination with wooden branch mallet this will greatly increase the possibilities of carving and making mortis and tenon joints.',' Use wetstone grinding method that is described for Stone Axehead.',' null'),(13,' Fishbasket Trap',' primitive woodworking',1,1,1,9,NULL,' TheGuy',' A good trap option for catching fish.',' null',' null'),(14,' Clay',' foraging',1,1,1,11,NULL,' TheGuy',' This essential material will be useful most things you work with in beginning, specifically in making pots for transporting/collecting water, and your first water filtration method. But also especially for shelters, and kilns/furnaces.',' The methods which exist are numerous, but my preferred is obtaining from termite hill, or by digging a hole with branch and adding water and stirring it up letting the heavy rocks settle and picking out the sticks and organic matter on the top, then adding 20% sand or terracotta for grog.',' null'),(15,' Puki',' claymaking',1,1,1,12,NULL,' TheGuy',' This item is optional, but recommended, especially if you plan on making multiple clay pots. It is simply a round shallow dish which allows to make round-bottom pots or other round clay objects.',' null',' null'),(16,' Clay Pot',' claymaking',1,1,1,13,NULL,' TheGuy',' Useful for transporting water, especially if you make two and attach with plant cordage to a yoke which you can carry on your shoulders.',' null',' null'),(17,' Charcoal Mound',' claymaking',1,1,1,14,NULL,' TheGuy',' The ability to create your own charcoal in large amounts is unlocked with this skill.',' Simply lay down a thick pile of sticks in the shape of a teepee, then cover with adobe mud, make several holes on all sides and the top, then start a fire in the top, and once the fire has been going for a while, cover each hole up with adobe mud, when you open the mound youll have a bunch of quality charcoal inside.',' null'),(18,' Charcoal Water Filter',' water filtration',1,1,1,15,NULL,' TheGuy',' A simple yet effective means of filtering out microorganisms and parasites from water, it doesnt remove all impurities from the water, but does make it safe to drink.',' Simply pile rocks on top of gravel on top of sand on top of charcoal dust in a container with a opening at the bottom for water to flow out. The thicker the layers the more pure the water will be.',' null'),(19,' Clay Brick/shingles Mold',' claymaking',1,1,1,16,NULL,' TheGuy',' These Molds allow you to efficiently reproduce consistent sized bricks and shingles for building a shelter with.',' null',' null'),(20,' Pump Drill',' claymaking',1,1,1,17,'primitive bellows',' TheGuy',' The pump drill can work as a firestarter, a primitive drill, or a bellows for kilns/forges depending on how you modify it.',' null',' null'),(21,' Stick Fan',' primitive woodworking',1,1,1,17,'primitive bellows',' TheGuy',' This item can be used as a bellows for a furnace when you combine it with a spout.',' null',' null'),(22,' Clay Spout',' claymaking',1,1,1,18,NULL,' TheGuy',' This spout is a way of capturing wind produced from the stick fan or the pump drill fan, and directing it in full force towards the root of a campfire, furnace or kiln, making the coals receive plenty of oxygen to burn hot enough to turn steel white hot.',' null',' null'),(23,' Clay Kiln',' claymaking',1,1,1,19,NULL,' TheGuy',' This kiln is for the purpose of firing your clay products. So design it with that in mind. Make sure there is room for whatever you plan on putting in there. Specifically, you should try to build one that can allow space for large pots, or for bricks/shingles to be stacked side by side. But then again for bricks you have the option to stack them around a large fire.',' null',' null'),(24,' Clay/Wood Shelter',' claymaking',1,1,1,20,NULL,' TheGuy',' Using bricks and shingles you can build this, or you can build a wood frame and use clay or bricks around that frame. Whatever style you want. Just make sure it gives you enough shelter from the elements and from dangerous animals.',' null',' null'),(25,' Cave Man Soap',' fire',1,1,1,21,NULL,' TheGuy',' Now that you can effectively provide oxygen to fireplace or furnace/kiln with your stick fan/pump drill bellows, now you should have no problem getting plenty of wood ash which is the white powder left behind after a fire. Using wood ash is a great means of cleaning grease off your body/hands as it is great at soaking up the grease, and then when you rinse with water the ash and grease come right off.',' null',' null'),(26,' Lye',' fire',1,1,1,22,NULL,' TheGuy',' Once you obtain a good amount of wood ash, one useful thing you can do with it is create lye. lye is a powerful acid, and it can be used in making modern soap when you combine it with animal fat and optional fragrance material.',' null',' null'),(27,' Forage for Renewables',' foraging',1,1,1,23,NULL,' TheGuy',' There are two reasons to forage right now. You need to find medicinal herbs and spices to grow at your shelter, because that is key to making your own first-aid kit, and at this point, you should have access to food through normal foraging, hunting, trapping and fishing, but those are not usually consistent sources. In order to ensure you can have more consistent meals, your focus should be on obtaining plants, seeds, beehives, livestock etc... Now as far as getting livestock goes, the amount of effort it takes to obtain any meaningful livestock from nature and domesticate it is extremely difficult in most cases, which is why this is one priority that I would recommend you buy from someone with already domesticated livestock. If thats not possible for you, then no worries, you have alternatives. But if that is an option for you, I highly recommend you take it. The chances of you capturing something alive, with minimal tools is small enough, but capturing two of the same species alive without killing them, and managing to domesticate them to the point where they dont kill themselves trying to escape and start to live relaxed enough to breed new livestock is almost impossible. Not completely impossible, but just very very unlikely. Beyond that, if you can bring seeds or plants from civil society with you as well, that would also be very beneficial as the chances of you finding lots of wild plants that provide decent nutrition is small.',' null',' null'),(28,' Stone Hoe',' primitive stoneworking',1,1,1,24,'gardening implement',' TheGuy',' A reasonable tool for basic gardening/planting of crops.',' null',' null'),(29,' Antler hoe/pickaxe',' primitive woodworking',1,1,1,24,'gardening implement',' TheGuy',' The ideal tool for basic gardening/planting of crops. Since even if you smash against a stone, it likely wont break. It will also be useful in digging hole, wells or channels.',' null',' null'),(30,' Fertilizer',' foraging',1,1,1,25,NULL,' TheGuy',' For gardening youll want to use fertilizer. Luckily, in nature there should be abundant sources of fertilizer.',' Search around, and if you do find animal waste, combine it with wood chips or sawdust and dirt and that can work as a makeshift fertilizer. The reason you combine it with those is to dilute it so that the ammonia from the waste doesnt burn your plants and kill them.',' null'),(31,' Bloomery Furnace',' fire',1,1,1,26,NULL,' TheGuy',' This furnace has a hole in the side which allows wind to flow through and the heat from the fire will continually increase the speed of the airflow because of the rising heat. Which means you dont have to do hardly any work to provide oxygen to the coals/wood and it reaches the high temps needed to smelt iron from ore, causing a bloom which will be recoverable after a few hours of smelting.',' Use adobe brick/mud to build up a tall tower, and keep a hole in the side with support for the airflow.',' null'),(32,' Forage for Metals',' foraging',1,1,1,27,NULL,' TheGuy',' At this point, you can take some time to search for sources of metal in your area. Some type of metal can be found almost anywhere. If you have salvagable metals from a vehicle or something, that is always nice, but if not, you can procure a variety of metals out in nature. Copper occurs naturally in its copper form and can be cold-forged, iron is abundant and can be smelted then forged to shape, lead, zinc, tin, are all also possible to find and those metals are much easier to produce and shape/cast from their respective ores than iron.',' null',' null'),(33,' Tree Stump Anvil',' blacksmithing',1,1,1,28,NULL,' TheGuy',' Once you find a metal source to work with, you can use a stone on top of a tree stump to forge it into the shape you want, or even better, if you have a decent amount of metal, you can place the metal on or in the top of the stump.',' For the stone, simply carve a divet in the shape of the stone into the top of the stump and place the stone inside. For a metal top, you can either nail it to the top, or you can make a stake from the metal and drill a large enough hole in the top using fire drill method or the pump drill to allow the bottom of the metal stake to be driven in with a hammer.',' null'),(34,' Wood or Clay Mortar and Stone Pestle',' stoneworking',1,1,1,29,NULL,' TheGuy',' A Mortar and Pestle allows you to grind clay, corn, wheat, and many other things. But the primary use well have for it is to produce medicine using medicinal herbs that you have grown.',' Make a clay or wood bowl/cup, then make a stone pestle using the stone shaping method of either knapping or wetstone grinding.',' null'),(35,' Deer Hide Glue',' hunting',1,1,1,30,NULL,' TheGuy',' Deer hide glue is dead simple to make, and provides a great means of attaching objects together.',' null',' null'),(36,' Leather Tanning Rack',' primitive woodworking',1,1,1,31,NULL,' TheGuy',' A rack to hold leather as it sits in the sun to tan.',' null',' null'),(37,' Leather',' leatherworking',1,1,1,32,NULL,' TheGuy',' Useful to make bandages, clothes, and pouches/containers.',' null',' null'),(38,' Leather Bandages',' leatherworking',1,1,1,33,NULL,' TheGuy',' A priority item to allow for handling cuts, gashes and other first-aid applications.',' Simply cut a patch of raw leather, add deer hide glue and a medicinal herb or disinfectant and apply to wound/cut to stop bleeding and allow for healing.',' null'),(39,' Needle',' blacksmithing',1,1,1,34,NULL,' TheGuy',' Required to stitch/suture a wound.',' Try to find a piece of metal that is already close to the right shape, it could be aluminum, bronze, copper, iron. Then hammer it into the shape of a skinny sharp needle.',' null'),(40,' Thread',' ropemaking',1,1,1,35,NULL,' TheGuy',' If you have grown your own linen from flax, or cotton, or you have silk from silk worms, you can make thread for stitches/suturing wounds.',' null',' null'),(41,' Leather Waterskin',' leatherworking',1,1,1,36,NULL,' TheGuy',' A convenient way to carry water or medicine. Preferable to clay pots.',' null',' null'),(42,' Surgical Knife',' blacksmithing',1,1,1,37,NULL,' TheGuy',' A priority item for emergency first-aid and surgery.',' null',' null'),(43,' Surgical Saw',' blacksmithing',1,1,1,38,NULL,' TheGuy',' A priority item for emergency first-aid and amputation.',' null',' null'),(44,' Clothing',' blacksmithing',1,1,1,39,NULL,' TheGuy',' At this point, it should be possible to make some clothing items using any cloth material or leather. If you make a primitive loom first, then you will be able to make fine cloth with your source of thread or string. Wool, plant cordage, linen, silk, cotton, and leather are all good possible materials for clothing.',' null',' null'),(45,' Modern Soap',' chemistry',1,1,1,40,NULL,' TheGuy',' Modern soap is a nice upgrade from using cave man soap. It just requires lye and animal fat. Optionally you can add fragrance with flower petals or something.',' null',' null'),(46,' Yeast',' microbiology',1,1,1,41,NULL,' TheGuy',' Used in breadmaking.',' null',' null'),(47,' Linseed oil',' gardening',1,1,1,42,'tool preservation',' TheGuy',' Used with beeswax to protect metal tools, or used by itself to seal wood tools.',' null',' null'),(48,' Fatwax',' hunting',1,1,1,42,'tool preservation',' TheGuy',' Wax mixed with animal fat used to protect metal and wood tools. Much easier to make than linseed oil.',' Simply cook animal fat in a pot until melted, and remove any solids, then add wax to the mix. Around 50% should be wax and 50% fat.',' null'),(49,' Grinding Stone Wheel',' primitive stoneworking',1,1,1,43,NULL,' TheGuy',' A nice method of sharpening tools and sanding wood.',' null',' null'),(50,' Wood Ash Cement',' fire',1,1,1,44,'cement',' TheGuy',' Cement made using wood ash, it is tough and waterproof.',' null',' null'),(51,' Roman Concrete',' claymaking',1,1,1,44,'cement',' TheGuy',' A solid aggregate made with any calcium carbonate or quick-lime material. Possible ingredients include animal shells such as snail or sea shells and limestome.',' null',' null'),(52,' Rope',' ropemaking',1,1,1,45,NULL,' TheGuy',' You may have string and cords, but soon you will need actual thick rope. The goal is to make rope at least 1/2 inch thick at this point.',' You may use any method you prefer to make rope, including making a jig or using the twisting method.',' null'),(53,' Wheat Grinder',' primitive stoneworking',1,1,1,46,NULL,' TheGuy',' A manual or automatic grinder useful for grinding wheat, corn, or even clay if needed.',' null',' null'),(54,' Measuring Tape',' carpentry',1,1,1,47,NULL,' TheGuy',' Simply a cord wrapped around a roll which you can use to measure using your relative measuring system. When coated in charcoal dust you can make straight marked lines on wood by snapping the string against the wood.',' null',' null'),(55,' Relative Measuring System',' carpentry',1,1,1,48,NULL,' TheGuy',' You can make a well designed measuring system that is relative to your own proportions. For example a fathom is the length of your arms stretched out side to side, and you can make more precise measurements like the length from first knuckle to fingertip etc...',' null',' null'),(56,' Charcoal Pencil',' carpentry',1,1,1,49,NULL,' TheGuy',' A useful tool for marking places to cut/shape wood alongside your measuring tape.',' null',' null'),(57,' Traditional Forge Bellows',' leatherworking',1,1,1,50,'bellows',' TheGuy',' This type of bellows requires less work to use than previous bellows on this list. But it does require a bit more work to make. You\'ll need leather, wood, and reasonable woodcarving and measuring skills to make this.',' null',' null'),(58,' Manual Air Pump',' blacksmithing',1,1,1,50,'bellows',' TheGuy',' This type of bellows uses a crank system that you manually wind, and it has a flywheel type mechanic to keep itself running and pushing air even after you release it. So it\'s a decent alternative to the traditional forge bellows.',' null',' null'),(59,' Metal Casting Molds',' foraging',1,1,1,51,NULL,' TheGuy',' At this point, you should be capable of making molds for metal casting, and you should probably have some metals that you have been wanting to cast. Namely lead, copper, bronze, aluminum, zinc and tin.',' null',' null'),(60,' Blacksmith Hammer',' blacksmithing',1,1,1,52,NULL,' TheGuy',' If you haven\'t been using a blacksmith hammer up to this point for shaping metals, this will be a huge improvement.',' null',' null'),(61,' Blacksmith Tongs',' blacksmithing',1,1,1,53,NULL,' TheGuy',' This will allow you to have better control over the material you\'re working with when blacksmithing. You can use pieces of wood to make some makeshift tongs, or if you have an abundance of metal, you can cast or forge some tongs from metal.',' null',' null'),(62,' Hole Punch Stake',' blacksmithing',1,1,1,54,NULL,' TheGuy',' A tool used for punching holes into metal during forging/blacksmithing.',' null',' null'),(63,' Marking Gauge',' carpentry',1,1,1,56,'woodworking tool',' TheGuy',' Used to make precise markings for wood carving and shaping wood.',' null',' null'),(64,' Block Plane',' blacksmithing',1,1,1,56,'woodworking tool',' TheGuy',' Used to make smooth and flat level surfaces on wood.',' null',' null'),(65,' Cloggers Knife',' blacksmithing',1,1,1,56,'woodworking tool',' TheGuy',' A useful knife which uses leverage to easily carve edges of wood like butter.',' null',' null'),(66,' Survival Tape Maker','fire',1,1,1,58,'scrap salvage',' TheGuy',' Recycle plastic bottles into practical and useful \"survival tape\". It can be shrink wrapped with heat to bind joints of wood to make furniture, chairs, tables, or for mechanical devices.',' null',' null'),(67,' Recycle Plastic','fire',1,1,1,58,'scrap salvage',' TheGuy',' Using a cross-draft kiln you can soften plastics enough to be able to press them into a mold. This way you can make bricks of plastic to carve into shapes or use for building, or you can press them into a mold you carved of wood or something which already is the shape you want. And you can reuse that mold as much as you want. The reason you\'ll want to know how to do this is because plastic has useful properties we can take advantage of in some later tasks. But you don\'t have to have it to make those things, so you can skip this if salvageable plastic isn\'t common in your area.',' null',' null'),(68,' Recycle Rubber','fire',1,1,1,58,'scrap salvage',' TheGuy',' For the same reasons as above salvaging rubber can be useful in some later projects, and this is can be done using the cross-draft kiln method as well.',' null',' null'),(69,' Recycle Glass','fire',1,1,1,58,'scrap salvage',' TheGuy',' Glass has useful unique properties just like plastic and rubber, but to salvage this is probably easier. Just fire it in a kiln until liquid and press into a mold, or you can even use a glassblower rod if you obtain or make that.',' null',' null'),(70,' Carpentry Bench',' carpentry',1,1,1,59,NULL,' TheGuy',' A optimized workbench will be very useful to you as you start to make more things from wood. You can make it with clay or wood.',' null',' null'),(71,' Yoke',' carpentry',1,1,1,61,NULL,' TheGuy',' A yoke is a wooden piece shaped to rest on your shoulders comfortable with rope attached to it\'s sides to connect to stuff that is usually difficult to carry by hand. It is very useful for carrying large amounts of water in buckets or pots, or really carrying anything in baskets as well.',' null',' null'),(72,' Compass',' navigation',1,1,1,62,NULL,' TheGuy',' If you don\'t have a compass, but you have a magnet of some sort, you can make your own compass.',' null',' null'),(73,' Map',' navigation',1,1,1,63,NULL,' TheGuy',' You can make maps on tablets of wood or plant or leather skins, but you can also make actual paper to use for this.',' null',' null'),(74,' Abacus',' carpentry',1,1,1,64,NULL,' TheGuy',' Making an abacus or having some other method of making quick calculations is essential for engineering, carpentry, and machine building.',' null',' null'),(75,' Hourglass',' carpentry',1,1,1,65,'timekeeping',' TheGuy',' A way to measure time passing.',' null',' null'),(76,' Candle Wick timer',' foraging',1,1,1,65,'timekeeping',' TheGuy',' A way to measure time passing.',' null',' null'),(77,' Sundial',' claymaking',1,1,1,65,'timekeeping',' TheGuy',' A way to measure the current time of day.',' null',' null'),(78,' Waterwheel',' carpentry',1,1,1,66,'basic energy production',' TheGuy',' A useful device for energy production. But it\'s rare to have a reasonable sized stream or river nearby to be able to use this with. There are different types of water wheels. There is the traditional waterwheel, and there is also archimedes screw. The archimedes screw has the benefit of also allowing one to reverse the flow of water, so it can be pumped back up.',' null',' null'),(79,' Wind Turbine',' carpentry',1,1,1,66,'basic energy production',' TheGuy',' Another useful option for energy production. It\'s not the most consistent, but depending on how windy it is where you are, it can produce a decent amount of energy. You can make the blades with plastic that you salvaged or with cloth/leather.',' null',' null'),(80,' Capstan',' carpentry',1,1,1,66,'basic energy production',' TheGuy',' A human or animal powered device allowing you to lift much heavier objects with ease, and you can use it to store energy in the form of pumped hydro or compressed air. You can combine it with your yoke to change it to a pull instead of pushing motion.',' null',' null'),(81,' Water Pump',' carpentry',1,1,1,67,NULL,' TheGuy',' You can make a water pump for multipler purposes. For instance, you may rely on pumped hydro to store energy for later use. Or, you need to pump water to transport it, or you may simply need to pump it out of a flooded area. You can choose to make a water displacement pump, or a traditional centrifugal pump.',' null',' null'),(82,' Air Compressor',' blacksmithing',1,1,1,68,NULL,' TheGuy',' An air compressor is very useful, it will allow you to store energy in a compressed air tank, and it can be used in many types of air conditioners/heat pumps, and fridgerators or even cryo-coolers.',' null',' null'),(83,' Compressed Air Tank',' blacksmithing',1,1,1,69,NULL,' TheGuy',' A tank used to store energy in the form of compressed air. When released you are able to use that stored energy to power machines.',' null',' null'),(84,' Air Conditioner/Heat Pump',' blacksmithing',1,1,1,70,NULL,' TheGuy',' At this point it should be possible to make some form of air conditioner using your air compressor that you made. These should always be powered by some mechanical energy source, not electricity as that is inneficient.',' null',' null'),(85,' Salt',' foraging',1,1,1,71,NULL,' TheGuy',' Salt is not just a required and tasty mineral to have in our diet, but also a useful means of storing raw meat in the wild.',' null',' null'),(86,' Steam Engine',' blacksmithing',1,1,1,72,'complex energy production',' TheGuy',' A Steam engine runs on any solid fuel such as coal, charcoal, and wood. It is a effective means of producing power for your machines.',' null',' null'),(87,' Stirling Engine',' blacksmithing',1,1,1,72,'complex energy production',' TheGuy',' Stirling engine runs on temperature differential. It can be an effective means of power, and has some pros and cons compared with a steam engine.',' null',' null'),(88,' Combustion Engine',' blacksmithing',1,1,1,72,'complex energy production',' TheGuy',' Combustion engine runs on gasoline, and thankfully in the wild, there is endless amounts of wood gas which is a alternative to traditional gasoline and can be used to fuel combustion engines.',' null',' null'),(89,' Tesla Turbine',' blacksmithing',1,1,1,72,'complex energy production',' TheGuy',' The Tesla Turbine is fueled by compressed air, and is highly efficient in doing so.',' null',' null'),(90,' Compressed Air Turbine',' blacksmithing',1,1,1,72,'complex energy production',' TheGuy',' This has pros and cons when compared with tesla turbine, in many situations it can be a preferable alternative.',' null',' null'),(91,' Wood Gasifier',' blacksmithing',1,1,1,73,NULL,' TheGuy',' A wood gasifier not only will produce fuel for your combustion engine or any gas powered devices like chainsaws or vehicles, it also has a nice byproduct of tar and charcoal during the process. So this nets you 3 useful materials from one single process.',' null',' null'),(92,' Power Hammer',' blacksmithing',1,1,1,74,NULL,' TheGuy',' A power hammer will make blacksmithing a much easier job, since it will basically do the work for you, you just have to hold the material in place for it to hit. It\'s relatively simple to hook up to any of your energy producing machines.',' null',' null'),(93,' Black Powder',' chemistry',1,1,1,75,NULL,' TheGuy',' If you use black-powder rifles or firearms, then being able to make some of your own is a useful skill to have, and you may need to depend on it.',' null',' null'),(94,' Black Powder Rifle',' blacksmithing',1,1,1,76,NULL,' TheGuy',' If you don\'t have access to any firearms, then this is a essential tool for self defense and hunting.',' null',' null'),(95,' Water Pipes',' blacksmithing',1,1,1,77,NULL,' TheGuy',' A effective means of transporting water if you have water pumps to use with it.',' null',' null'),(96,' Pumped Hydro Storage',' engineering',1,1,1,78,NULL,' TheGuy',' If you have abundance of water, being able to convert energy from your energy producing machines into stored energy for use later is very useful. Hydro storage just means water that can be released downward to power a turbine. For example dams use this technology a lot. They release water when energy is needed, and pump it back up when energy is not needed using wind or solar energy to store the energy for later when the demand for energy rises again.',' null',' null'),(97,' Manual Treadmill',' engineering',1,1,1,79,NULL,' TheGuy',' If you have to exercise daily through running, you might as well convert that to stored mechanical energy for use later.',' null',' null'),(98,' Bench Press/Squat Rack',' engineering',1,1,1,80,NULL,' TheGuy',' If you have to build muscle through weight training, you might as well attach a air compressor pump to the machine and store your mechanical energy as compressed air. The more you workout, the strong you\'ll be and the more energy you\'ll produce.',' null',' null'),(99,'Hand Auger','blacksmithing',1,1,1,56,'woodworking tool','TheGuy','The fastest and most effective means of drilling holes by hand without a brace or modern style drill. Very useful for many woodworking projects.',NULL,NULL),(100,'Fire Drill','primitive woodworking',1,1,1,10,NULL,'TheGuy','A way to drill or easily shape holes in wood before having significant iron tools/drills.','Basically you use a bow or pump drill to start a coal burning and then place that in a piece of wood that you want to create a hole or hollow part in, then use a fan or your breath to keep the coal burning until the hole has been burned through.',NULL),(101,'Drawknife','blacksmithing',1,1,1,55,NULL,'TheGuy','A very useful and fast woodshaping tool. It is easy to use, gives the user more control than other carving methods, and allows for deep and efficient shaving of wood. It is best used with a shavehorse of some kind. It is good for many things, but exceptionally great for carving long wooden bows.',NULL,NULL),(102,'Shavehorse','carpentry',1,1,1,60,NULL,'TheGuy','For use with a drawknife, this makes holding wood in place for carving much easier.',NULL,NULL);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskCompletion`
--

DROP TABLE IF EXISTS `taskCompletion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taskCompletion` (
  `user_id` int(10) unsigned NOT NULL,
  `task_id` int(10) unsigned NOT NULL,
  `timeSpent` time NOT NULL,
  `dateCompleted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskCompletion`
--

LOCK TABLES `taskCompletion` WRITE;
/*!40000 ALTER TABLE `taskCompletion` DISABLE KEYS */;
INSERT INTO `taskCompletion` VALUES (1,1,'01:34:11','2021-05-19 20:21:27');
/*!40000 ALTER TABLE `taskCompletion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'TheGuy','Jared','098395597ebc3fe5941abfec8af96cc0619f10a9286778576b3c030cac36fd1e','jared@gurrfamily.com','','2021-05-19 20:33:23',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-28 13:07:57
