int main(string[] args) {
    Gtk.init (ref args);

    var window = new MyApp();
    //  window.destroy.connect(Gtk.main_quit);
    window.window_main.show_all();

    Gtk.main();
    return 0;
}