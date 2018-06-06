using Gtk;

public void on_quit_option_activate() {
    Gtk.main_quit();
}

public void on_set_address1_clicked() {
    stdout.printf("on_set_address1_clicked\n");
}

public void on_check1_clicked() {
    var builder = new Builder();
    Gtk.Label yarr_label = (Gtk.Label) builder.get_object("status_label");
    //  yarr_label.set_text("yarrr");
    stdout.printf(yarr_label.get_text());
}

public void on_about_option_activate() {
    stdout.printf("on_about_option_activate\n");
}

public static int main(string[] args) {
    Gtk.init(ref args);

    try {
        var builder = new Builder();
        builder.add_from_file("../gui/net.glade");
        builder.connect_signals(null);
        var window = builder.get_object("window_main") as Window;
        window.destroy.connect(Gtk.main_quit);
        window.show_all();
        Gtk.main();
    } catch (Error e) {
        stderr.printf("Could not load UI: %s\n", e.message);
        return 1;
    }

    return 0;
}