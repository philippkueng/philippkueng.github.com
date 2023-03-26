---
layout: post
title: "Reset your Synology NAS after a SynoLocker attack"
comments: true
---

![Encrypted Data](/images/cryptolocker.jpg)

Personal NAS-es are quite handy, however their wide spread usage and the fact that people don't often check their system via the web dashboard makes it a perfect target for crackers trying to extort you for money or just using your machine to mine bitcoins for them.

In this case I had a DS213j delivered to me with SynoLocker on it. A malicious piece of code that encrypts all your files and holds them hostage until you give in and pay them what they ask for. **Please don't ever give in.** Just accept that your data is lost forever and you hopefully have a backup of it somewhere else, if not, now would be a good time to start thinking about one.

So on that basis, the fix is fairly trivial.

1. Open the lid and take out all of the drives.
2. Put one into a desktop computer or use a S-ATA to USB docking station to connect it to a working machine so you can format the drive with FAT.
3. Put the one drive back into the NAS and boot it up.
4. As soon as it's booted, reset it by taking a paperclip and pressing the reset button on the back for 4 seconds until it beeps. Release. Press again for 4 seconds until it beeps again for 3 times. This will initiate a restart.
5. Download the [Synology Assistant](http://www.synology.com/en-us/support/download) and install it on your computer, then start it up.
6. If your NAS isn't already showing up, give it some time to finish the booting process and then click the search button in the Synology Assistant.
7. Double click on the entry for your NAS which will open a browser window.
8. Download the latest Diskstation Firmware (DSM) from the [Synology Download Center](http://www.synology.com/en-us/support/download) and go through the questions in the browser.
9. Upload your firmware and let the NAS re-format your disk, then give it some time for it to re-install.
10. When all is done, format all the other drives with the same process you used for the first drive. Shutdown the NAS and put them back in. Restart and go into the Storage Manager > Volume where you can add the newly inserted drives to your volume. Once added it will take a while for them to be added and re-index, partitiend, etc., you can safely use your NAS from now on however.
11. Now you might want to re-add your video, music and photo folders. That's it.

On a further note, since crackers were able to get into your NAS once, I'd ask yourself whether you really need external access to it and otherwise make sure there are no ports being forwarded by your router. Also I recommend changing your router password, especially in case it's still the factory default one. If you really do need remote access, at least change the ports which are used externally, eg. map 3001  to 5000 internally.

Lastly, I've used automatic DNS updating services quite a bit too, however they could have been the enabling party for the attack. Once such a provider is compromised, crackers can check their attacks against all your ports which makes the previous advice in-effective. Since routers nowadays don't change their ip addresses that much I usually look up my home address via the GMail login history and use the naked IP. Less convenient, but more secure.

Hope this short summary helped during your reset and it's the last time something like that happened.