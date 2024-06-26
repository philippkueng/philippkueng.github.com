Date: 2011-07-10
Title: Deploy BlogEngine.NET on Ubuntu 10.04 LTS
Comments: true
Tags: BlogEngine.NET, Ubuntu


<p>Lately I&#8217;ve gotten several E-Mails a day from monitoring sites that look after my websites hosted on Genotec
    containing messages like &#8220;you&#8217;re site is down&#8221;.</p>

<p>So migrating to another hosting provider was the obvious way to go, however since there&#8217;s no other
    Shared-Hosting company in Switzerland, that I know of, offering .NET hosting I decided to go the Open Source route
    and run <a href="https://blogengine.codeplex.com/">BlogEngine</a> on Ubuntu.</p>

<p>While I wasn&#8217;t able so far to get the most recent release, version 2.5, to run on Ubuntu I simplified the
    installation process for doing so with release <a
        href="https://blogengine.codeplex.com/releases/view/39387">1.6.1</a> by writing a script so that everyone should
    be able to install it themselves.</p>

<p>Now to the installation process. Take a clean install of <a
        href="https://www.ubuntu.com/download/server/download">Ubuntu 10.04 LTS</a> either running in the cloud or
    virtualized on your local machine.</p>

<p>Then go through the steps below to execute the BlogEngine.NET installation script.</p>

```bash
# Login to your VM.
ssh your_username@your_ip

# Gain root privileges.
sudo su

# Go to the root home directory.
cd

# Download the BlogEngine.NET install script
wget http://bit.ly/blogengine_install

# Set Execute-Permissions on the install file.
chmod +x blogengine_install

# Start the setup by executing the installation script.
./blogengine_install
```

<p>You should now have an Ubuntu sever running BlogEngine. To validate that it&#8217;s actually working start your
    browser and enter the VMs IP.</p>

```bash
# Command to get the VMs IP when logged in to the server.
$ ifconfig eth0
```

<p>Congratulations on not relying on proprietary software anymore.</p>
