/*
* Copyright (c) 2018 KJ Lawrence <kjtehprogrammer@gmail.com>
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
*/

using App.Configs;

namespace App {

    /**
     * The {@code Application} class is a foundation for all granite-based applications.
     *
     * @see Granite.Application
     * @since 1.0.0
     */
    public class Application : Granite.Application {

        public Window window { get; private set; default = null; }

        /**
         * Constructs a new {@code Application} object.
         *
         * @see webwatcher.Configs.Constants
         */
        public Application () {
            Object (
                application_id: Constants.ID,
                flags: ApplicationFlags.FLAGS_NONE
            );

            Granite.Services.Logger.DisplayLevel = Granite.Services.LogLevel.INFO;
            Granite.Services.Logger.initialize (Constants.PROGRAM_NAME);
        }


        /**
         * Create the window of this application through the class {@code Window} and show it. If user clicks
         * <quit> or press <control + q> the window will be destroyed.
         *
         * @return {@code void}
         */
        public override void activate () {
            var settings = App.Configs.Settings.get_instance ();

            if (window == null) {
                window = new Window (this);
                add_window (window);

                window.delete_event.connect ((event) => {
                    settings.save_window_pos (window);

                    if (settings.hide_on_close) {
                        window.hide_on_delete ();
                        return true;
                    }

                    return false;
                });

                return;
            }

            int x = settings.window_x;
            int y = settings.window_y;

            if (x != -1 && y != -1) {
                window.move (x, y);
            }

            window.get_focus ();
            window.no_show_all = false;
            window.show_all ();
        }
    }
}
