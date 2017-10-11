                   .:                     :,                                          
,:::::::: ::`      :::                   :::                                          
,:::::::: ::`      :::                   :::                                          
.,,:::,,, ::`.:,   ... .. .:,     .:. ..`... ..`   ..   .:,    .. ::  .::,     .:,`   
   ,::    :::::::  ::, :::::::  `:::::::.,:: :::  ::: .::::::  ::::: ::::::  .::::::  
   ,::    :::::::: ::, :::::::: ::::::::.,:: :::  ::: :::,:::, ::::: ::::::, :::::::: 
   ,::    :::  ::: ::, :::  :::`::.  :::.,::  ::,`::`:::   ::: :::  `::,`   :::   ::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  :::::: ::::::::: ::`   :::::: ::::::::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  .::::: ::::::::: ::`    ::::::::::::::: 
   ,::    ::.  ::: ::, ::`  ::: ::: `:::.,::   ::::  :::`  ,,, ::`  .::  :::.::.  ,,, 
   ,::    ::.  ::: ::, ::`  ::: ::::::::.,::   ::::   :::::::` ::`   ::::::: :::::::. 
   ,::    ::.  ::: ::, ::`  :::  :::::::`,::    ::.    :::::`  ::`   ::::::   :::::.  
                                ::,  ,::                               ``             
                                ::::::::                                              
                                 ::::::                                               
                                  `,,`


http://www.thingiverse.com/thing:1221911
Micro 105 FPV Quadcopter - 8.5mm Motors, Micro Scisky by punkkills is licensed under the Attribution - Non-Commercial - Share Alike license.
http://creativecommons.org/licenses/by-nc-sa/3.0/

# Summary

This frame was inspired by the [FireFlo V2](http://www.thingiverse.com/thing:1133306) and the [Alpine Drones Micro H](http://www.thingiverse.com/thing:717375).  My goals were to keep it crash resistant, light weight and offer good protection for onboard gear. 

It measures ~105mm.  The V1 frame weighs ~10g and the V2 frame weighs ~8g when printed in PLA.  My full build (currently V2 base and V1 top) weighs ~38g without the battery.  It is designed around 8.5mm motors and the Micro Scisky flight controller.  The camera mount is angled up 13 degrees to accommodate fast forward flight.

My Setup
=======
* **Flight Controller**: [MicroScisky](http://www.banggood.com/Micro-Scisky-32bits-Brushed-Flight-Control-Board-Based-On-Naze-32-For-Quadcopters-p-1002341.html)
* **Motors**: [Hubsan X4 H107c 8.5mm Motors](http://www.banggood.com/2-X-8x20mm-Motor-For-Hubsan-X4-H107C-H107D-RC-Quadcopter-p-87683.html)
* **VTX**: [FX758-2 5.8G 200mW Video Transmitter](http://www.banggood.com/FPV-5_8G-200mW-32CH-Wireless-Audio-Video-AV-Transmitter-Module-FX758-2-p-980317.html)
* **Antenna**: I used the inner wire from the coaxial cable of a broken clover leaf antenna. I used the default frequency on the FX758-2 which is 5865. After soldering the wire on, I cut the antenna to 12.8mm which is the [quarter wavelength of that frequency](https://www.easycalculation.com/physics/electromagnetism/antenna-wavelength.php)
* **Camera**: [170 Degree Wide Angle Camera](http://www.banggood.com/600TVL-8_0MP-14-2_8mm-CMOS-FPV-170-Degree-Wide-Anlge-Lens-Camera-PALNTSC-p-984345.html)
* **Battery**: I currently have a handful of [Hubsan X4 batteries](http://www.banggood.com/Upgraded-25C-3_7V-380MAH-Battery-For-Hubsan-X4-H107-Ladybird--p-69870.html) that work pretty good.  I would like to try the [300mah Nano-Techs](http://www.hobbyking.com/hobbyking/store/uh_viewitem.asp?idproduct=37566&aff=1195429)
* **Props**: I am currently using  [Ladybird props](http://www.banggood.com/Wholesale-3-Set-Walkera-QR-Ladybird-Spare-Parts-Main-Blades-Propellers-QR-Ladybird-Z-01-p-47127.html?p=OY2106728901201408U4).  They hold up a lot better than the Hubsan props.
* **Battery Pigtail**: I cut one of the leads off of a [charging adapter](http://us.banggood.com/Wholesale-Warehouse-1-To-6-Balance-Charger-Cable-For-Walkera-Hubsan-X4-RC-Quadcopter-wp-Usa-85563.html).
* **Nylon Hardware**: M3 [nylon nuts](http://www.amazon.com/gp/product/B009EFSE32?psc=1&redirect=true&ref_=oh_aui_detailpage_o01_s00) and [machine screws](http://www.amazon.com/gp/product/B00F3390MS?psc=1&redirect=true&ref_=oh_aui_detailpage_o01_s01).  I used the 20mm machine screws and cut them to size after attaching to the frame.
* **Printable Standoff And Clip**: As an alternative to using nylon hardware, navyblueboss made a very nice [pin and clip set](http://www.thingiverse.com/thing:1336747).  I have not yet printed a set of these but they look great.
* **JST SH Connector**: Use [this](http://goo.gl/VNbjMQ) to get get a 5v supply for fpv gear.

Updates
=======
* **1/9/2016** - Added bottom-v2-experimental.  I was able to reduce the weight of the bottom of the frame to ~5.5g.  This saves ~1.5g from v1.  I don't think the frame durability will be affected much.
* **1/10/2016** - Added top-v2-experimental.  I was able to reduce the weight of the top of the frame to ~2.3g.  This save  ~0.5g from v1.  The v2 top and bottom combined should be ~8g when printed in PLA.  Both the v2 top and bottom will feel a bit flexy separately, but once they are connected the quad will feel solid but still allow some give in crashes.  I recommend using M3 nylon hardware to secure the pieces together.  I do not anticipate the v2 top compromising durability in any way.  **NOTE**: I have printed, but not flown with this top.  My camera is hot glued to the v1 top so I will need to find some time to make the switch.
* **1/11/2016** - Added top-v2-no-cam-experimental.  I've been doing some indoor LOS flying and wanted to see how it preformed without the FPV gear.  Wow, there is a lot of pop.
* **1/16/2016** - Added top-v2-cam-down-7.  This points the camera down 7 degrees. In order to clear the base plate, I had to push the camera forward just a bit and I made the standoffs of cam-down 1mm taller so the camera does not extend below the bottom plate.  I also removed the word "experimental" from v2 filenames.

Videos
======
https://youtu.be/qZ-qDsXewZI

# Instructions

Infill: 100%
Layer Height: 0.3mm
Extrusion Width: 0.4mm
Bottom Piece: 4 Perimeters
Top Piece: 2 Perimeters