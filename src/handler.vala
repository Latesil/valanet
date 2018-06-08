public class Handler : GLib.Object { 
    public Handler() {
    }

    [CCode (instance_pos = -1)]
    public void handler_on_quit_option_activate() {
        Gtk.main_quit();
    }

    [CCode (instance_pos = -1)]
    public void handler_on_set_address1_clicked() {
        stdout.printf("on_set_address1_clicked\n");
    }

    [CCode (instance_pos = -1)]
    public void handler_on_get_address_clicked() {
        stdout.printf("handler_on_get_address_clicked\n");
    }

    [CCode (instance_pos = -1)]
    public void handler_on_check1_clicked(Gtk.Label status_label) {
        var host = "www.google.ru";
        try {
            var resolver = Resolver.get_default();
            var addresses = resolver.lookup_by_name(host, null);
            var address = addresses.nth_data(0);
    
            var client = new SocketClient();
            var conn = client.connect(new InetSocketAddress(address, 80));
    
            var message = @"GET / HTTP/1.1\r\nHost: $host\r\n\r\n";
            conn.output_stream.write(message.data);
    
            var response = new DataInputStream(conn.input_stream);
            var status_line = response.read_line(null).strip();
            var response_list = status_line.split(" ");
            if (response_list[1] == "200") {
                status_label.label = "Connect: success!";
            } else {
                status_label.label = @"$status_line";
            }
        } catch (Error e) {
            stderr.printf("%s\n", e.message);
        }
    }

    [CCode (instance_pos = -1)]
    public void handler_on_about_option_activate() {
        stdout.printf("on_about_option_activate\n");
    }
}