using Gtk;

public class MyApp {

    public Gtk.Builder builder;
    public Gtk.Label status_label;

    public MyApp() {
        
    }

    public void on_quit_option_activate() {
        stdout.printf("on_quit_option_activate\n");
    }
    
    public void on_set_address1_clicked() {
        stdout.printf("on_set_address1_clicked\n");
    }
    
    public void on_check1_clicked(Gtk.Label status_label) {
        this.status_label.set_text("test");
    }
    
    public void on_about_option_activate() {
        stdout.printf("on_about_option_activate\n");
    }
}

public static int main(string[] args) {
    Gtk.init (ref args);

    var builder = new Builder();
    builder.add_from_file("../gui/net.glade");
    var window = builder.get_object("window_main") as Window;
    builder.connect_signals(new MyApp());
    var status_label = (Gtk.Label) builder.get_object("status_label");
    window.destroy.connect(Gtk.main_quit);
    window.show_all();

    Gtk.main();
    return 0;
}