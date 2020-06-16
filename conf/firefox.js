// (placeholder: first line is skipped) //

// Costum Mozilla User Preferences
// Overrides `prefs.js` when located in `~/Library/Application Support/Firefox/Profiles/PROFILEDIR/user.js`

// tests
pref("_.test.num_pref", 3);
defaultPref("_.test.bool_def_pref", true);

// ux
lockPref("accessibility.typeaheadfind", true);
lockPref("browser.tabs.insertAfterCurrent", true);
lockPref("browser.altClickSave", true);
lockPref("browser.download.panel.shown", true);
lockPref("devtools.toolbox.selectedTool", "webconsole");
lockPref("devtools.toolbox.tabsOrder", "webconsole,inspector,performance,memory,jsdebugger,styleeditor,netmonitor,storage,accessibility");
lockPref("extensions.incognito.migrated", true);
lockPref("findbar.highlightAll", true);
lockPref("browser.download.folderList", 2);
lockPref("browser.urlbar.trimURLs", false);
lockPref("view_source.wrap_long_lines", true);
lockPref("network.IDN_show_punycode", true);
lockPref("browser.pagethumbnails.capturing_disabled", true);
lockPref("browser.fixup.alternate.enabled", false);
lockPref("browser.privatebrowsing.autostart", true); // start in incognito
lockPref("browser.startup.page", 3); // restore prev session

// language and location
lockPref("browser.search.region", "US");
lockPref("browser.search.countryCode", "US");
lockPref("general.useragent.locale", "en-GB");
lockPref("distribution.searchplugins.defaultLocale", "en-GB");
lockPref("intl.accept_languages", "en-US, en");

// var
lockPref("browser.link.open_newwindow.restriction", 0);
lockPref("browser.newtabpage.enabled", false);
lockPref("signon.rememberSignons", false);
lockPref("signon.rememberSignons.visibilityToggle", false);
lockPref("browser.shell.checkDefaultBrowser", false);
lockPref("geo.wifi.uri", "");
lockPref("network.predictor.cleaned-up", true);
lockPref("geo.enabled", false);
lockPref("dom.popup_allowed_events", "click dblclick");
lockPref("app.normandy.enabled", false);
lockPref("toolkit.telemetry.hybridContent.enabled", false);
lockPref("devtools.onboarding.telemetry.logged", false);
lockPref("toolkit.telemetry.enabled", false);
lockPref("beacon.enabled", false);
lockPref("corroborator.enabled", false);
lockPref("browser.newtabpage.activity-stream.showSearch", false);
lockPref("browser.search.update", false);
lockPref("font.internaluseonly.changed", false);
lockPref("identity.fxaccounts.toolbar.accessed", false);
lockPref("services.sync.enabled", false);
lockPref("browser.urlbar.timesBeforeHidingSuggestionsHint", 0);
lockPref("app.update.auto", false);
lockPref("app.update.autodownload", "never");
lockPref("toolkit.crashreporter.infoURL", "");
lockPref("browser.aboutConfig.showWarning", false);
lockPref("browser.tabs.warnOnClose", false);
lockPref("browser.tabs.warnOnCloseOtherTabs", false);
lockPref("browser.tabs.warnOnOpen", false);
lockPref("browser.warnOnQuit", false);
lockPref("browser.sessionstore.max_tabs_undo", 0);
lockPref("browser.sessionstore.privacy_level", 2);
lockPref("browser.formfill.expire_days", 14);
