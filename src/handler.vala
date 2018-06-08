using Gtk;

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