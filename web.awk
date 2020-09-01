#/usr/bin/gawk -f

BEGIN {
    while ("awk" != "complex") {
        RS = ORS = "\r\n"
        HttpService = "/inet/tcp/80/0/0"
        Hello = "<HTML><HEAD>" \
                "<TITLE>Container Info</TITLE></HEAD>" \
                "<BODY><H2>Container Details</H2>" \
                "<div class=\"info\">" \
                "<p><span>IP:</span> <span>"s_addr"</span></p>" \
                "<p><span>Name:</span> <span>"s_hostnm"</span></p>" \
                "<p class=\"smaller\"><span>"strftime()"</span></p>" \
                "</div>" \
                "</BODY></HTML>"
        Len = length(Hello) + length(ORS)
        print "HTTP/1.0 200 OK"          |& HttpService
        print "Content-Length: " Len ORS |& HttpService
        print Hello                      |& HttpService
        while ((HttpService |& getline) > 0)
            continue;
        close(HttpService)
    }
}
