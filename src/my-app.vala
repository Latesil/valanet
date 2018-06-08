using Gtk;

public class Handler : GLib.Object { 
    public Handler() {
    }

    [CCode (instance_pos = -1)]
    public void handler_on_quit_option_activate() {
        stdout.printf("on_quit_option_activate\n");
    }

    [CCode (instance_pos = -1)]
    public void handler_on_set_address1_clicked() {
        stdout.printf("on_set_address1_clicked\n");
    }

    [CCode (instance_pos = -1)]
    public void handler_on_check1_clicked(Gtk.Label status_label) {
        (status_label.label != "yarrr") ?
        (status_label.label) = "yarrr" : 
        (status_label.label) = "StatusQuo";
    }

    [CCode (instance_pos = -1)]
    public void handler_on_about_option_activate() {
        stdout.printf("on_about_option_activate\n");
    }
}

public class MyApp : GLib.Object { 

    public Gtk.Window window_main;
    public Gtk.Label status_label;
    public Gtk.Button check1_btn;
    public Gtk.Button set_address1_btn;
    public Gtk.MenuItem quit_option_mi;
    public Gtk.MenuItem about_option_mi;

    public MyApp() {
        var handler = new Handler();
        Builder builder = new Builder();
        try {
            builder.add_from_file("../gui/net.glade");
        } catch (Error e) {
            stderr.printf("%s", e.message);
        }
        window_main = builder.get_object("window_main") as Window;
        window_main.title = "test title";
        window_main.destroy.connect(Gtk.main_quit);
        status_label = (Gtk.Label) builder.get_object("status_label");
        check1_btn = (Gtk.Button) builder.get_object("check1");
        set_address1_btn = (Gtk.Button) builder.get_object("set_address1");
        quit_option_mi = (Gtk.MenuItem) builder.get_object("quit_option");
        about_option_mi = (Gtk.MenuItem) builder.get_object("about_option");


        check1_btn.clicked.connect(() => {
            handler.handler_on_check1_clicked(status_label);
        });

        set_address1_btn.clicked.connect(() => {
            handler.handler_on_set_address1_clicked();
        });

        quit_option_mi.activate.connect(() => {
            handler.handler_on_quit_option_activate();
        });

        about_option_mi.activate.connect(() => {
            handler.handler_on_about_option_activate();
        });
    }
}