            (function () {

                var converter1 = Markdown.getSanitizingConverter();
                Markdown.Extra.init(converter1, {
                  extensions: "all",
                  highlighter: "prettify"
                });
alert(43);
                var editor1 = new Markdown.Editor(converter1);
                editor1.hooks.chain("onPreviewRefresh", prettyPrint); // google code prettify
                editor1.run();
                
                var converter2 = new Markdown.Converter();

                converter2.hooks.chain("preConversion", function (text) {
                    return text.replace(/\b(a\w*)/gi, "*$1*");
                });
                converter2.hooks.chain("plainLinkText", function (url) {
                    return "This is a link to " + url.replace(/^https?:\/\//, "");
                });
                
                // "all" is the default
                Markdown.Extra.init(converter2, {highlighter: "prettify"});

                var help = function () { alert("Do you need help?"); }
                var options = {
                    helpButton: { handler: help },
                    strings: { quoteexample: "whatever you're quoting, put it right here" }
                };
                var editor2 = new Markdown.Editor(converter2, "-second", options);
                editor2.hooks.chain("onPreviewRefresh", prettyPrint); // google code prettify
                
                editor2.run();
            })();
