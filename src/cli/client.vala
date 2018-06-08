void main(string[] args) {
    var host = args[1];

    if (args.length <= 1) {
        print("Need some address to connect to.\n");
        return;
    } else if (args.length > 2) {
        print("Too many addresses to connect to.\n");
        return;
    }

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
            print("Connect: success!\n");
        } else {
            print("Something went wrong\n");
            print("%s\n", status_line);
        }
    } catch (Error e) {
        stderr.printf("%s\n", e.message);
    }
}