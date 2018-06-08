using Gtk;

public class MyApp : GLib.Object { 

    private string _UIPath = "../gui/net.glade";
    public Gtk.Window window_main;
    public Gtk.Label status_label;
    public Gtk.Button check1_btn;
    public Gtk.Button set_address1_btn;
    public Gtk.Button get_address_btn;
    public Gtk.MenuItem quit_option_mi;
    public Gtk.MenuItem about_option_mi;

    public MyApp() {
        var handler = new Handler();
        Builder builder = new Builder();
        try {
            builder.add_from_file(UIPath);
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
        get_address_btn = (Gtk.Button) builder.get_object("get_address");

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

        get_address_btn.clicked.connect(() => {
            handler.handler_on_get_address_clicked();
        });
    }

    public string UIPath {
        get { return _UIPath; }
        set { _UIPath = value; }
    }
}