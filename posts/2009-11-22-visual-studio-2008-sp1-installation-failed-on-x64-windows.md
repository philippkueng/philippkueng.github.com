Date: 2009-11-22
Title: Visual Studio 2008 SP1 installation failed on x64 Windows with Error 1324
Comments: true
Tags: untagged

<p>If you&rsquo;ve installed Visual Studio 2008 on an x64 Windows Computer you may getting into trouble trying to
    install Service Pack 1. First of all you will get an error message (Error 1324) which will tell you that
    <strong>Program Files</strong> contains an invalid character. After the installation finished you can access the log
    file. (shown below)</p>
<p><img title="vs08sp1_installation_log" src="/assets/images/vs08sp1_installation_log_thumb.png"
        alt="vs08sp1_installation_log" /></p>
<p>In there select the link (marked yellow).</p>
<p><img title="vs08sp1_installation_error_log" src="/assets/images/vs08sp1_installation_error_log_thumb.png"
        alt="vs08sp1_installation_error_log" /> And now search for <strong>pfiles</strong>. You will find something like
    G:\PFiles. On my computer G was a virtual drive. So the solution was to deactivate all virtual and physical
    read-only drives and then try the installation all over again. This time it worked seamlessly.</p>
