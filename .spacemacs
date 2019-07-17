;; setq default
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq-default
    ;; additional packages
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    dotspacemacs-additional-packages '(yasnippet-snippets
                                          all-the-icons
                                          ecb
                                          )
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; additional packages



    ;; Layer and package installation config
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    dotspacemacs-distribution 'spacemacs
    dotspacemacs-enable-lazy-installation 'unused ;; If non-nil then Spacemacs will ask for confirmation before installing a layer lazily. (default t)
    dotspacemacs-ask-for-lazy-installation t ;; If non-nil layers with lazy install support are lazy installed. List of additional paths where to look for configuration layers.
    dotspacemacs-configuration-layer-path '() ;; List of configuration layers to load.
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Layer and package installation config



    ;; configuration layers
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    dotspacemacs-configuration-layers
    '(
         auto-completion
         (auto-completion :variables
             auto-completion-return-key-behavior 'complete
             auto-completion-tab-key-behavior 'complete
             auto-completion-complete-with-key-sequence nil
             auto-completion-complete-with-key-sequence-delay 0.1
             auto-completion-private-snippets-directory nil
             auto-completion-enable-snippets-in-popup t
             auto-completion-enable-help-tooltip t
             auto-completion-enable-sort-by-usage t
             ac-flyspell-workaround t
             )



         latex
         (latex :variables
             latex-build-command "LaTeX"
             latex-enable-auto-fill t
             TeX-view-program-selection '((output-pdf "PDF Tools"))
             )



         shell
         (shell :variables
             shell-default-height 30
             shell-default-position 'bottom
             shell-default-shell 'multi-term
             )



         spell-checking
         (spell-checking :variables
             spell-checking-enable-auto-dictionary t
             enable-flyspell-auto-completion t)



         c-c++
         (c-c++ :variables
             c-c++-enable-clang-support t)



         helm
         games
         csharp
         better-defaults
         emacs-lisp
         git
         markdown
         org
         bibtex
         syntax-checking
         version-control
         html
         pdf-tools
         javascript
         spacemacs-layouts
         ;;semantic
         )
    ;; configuration layers
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; setq default



;; Spacemacs init
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun dotspacemacs/init ()
    (setq-default
        ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
        ;; possible. Set it to nil if you have no way to use HTTPS in your
        ;; environment, otherwise it is strongly recommended to let it set to t.
        ;; This variable has no effect if Emacs is launched with the parameter
        ;; `--insecure' which forces the value of this variable to nil.
        ;; (default t)
        dotspacemacs-elpa-https nil
        ;; Maximum allowed time in seconds to contact an ELPA repository.
        dotspacemacs-elpa-timeout 300
        ;; If non nil then spacemacs will check for updates at startup
        ;; when the current branch is not `develop'. Note that checking for
        ;; new versions works via git commands, thus it calls GitHub services
        ;; whenever you start Emacs. (default nil)
        dotspacemacs-check-for-update nil
        ;; If non-nil, a form that evaluates to a package directory. For example, to
        ;; use different package directories for different Emacs versions, set this
        ;; to `emacs-version'.
        dotspacemacs-elpa-subdirectory nil
        ;; One of `vim', `emacs' or `hybrid'.
        ;; `hybrid' is like `vim' except that `insert state' is replaced by the
        ;; `hybrid state' with `emacs' key bindings. The value can also be a list
        ;; with `:variables' keyword (similar to layers). Check the editing styles
        ;; section of the documentation for details on available variables.
        ;; (default 'vim)
        dotspacemacs-editing-style 'emacs
        ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
        dotspacemacs-verbose-loading nil
        ;; Specify the startup banner. Default value is `official', it displays
        ;; the official spacemacs logo. An integer value is the index of text
        ;; banner, `random' chooses a random text banner in `core/banners'
        ;; directory. A string value must be a path to an image format supported
        ;; by your Emacs build.
        ;; If the value is nil then no banner is displayed. (default 'official)
        dotspacemacs-startup-banner 'official
        ;; List of items to show in startup buffer or an association list of
        ;; the form `(list-type . list-size)`. If nil then it is disabled.
        ;; Possible values for list-type are:
        ;; `recents' `bookmarks' `projects' `agenda' `todos'."
        ;; List sizes may be nil, in which case
        ;; `spacemacs-buffer-startup-lists-length' takes effect.
        dotspacemacs-startup-lists '((recents . 10)
                                        (projects . 10))
        ;; True if the home buffer should respond to resize events.
        dotspacemacs-startup-buffer-responsive t
        ;; Default major mode of the scratch buffer (default `text-mode')
        dotspacemacs-scratch-mode 'text-mode
        ;; List of themes, the first of the list is loaded when spacemacs starts.
        ;; Press <SPC> T n to cycle to the next theme in the list (works great
        ;; with 2 themes variants, one dark and one light)
        dotspacemacs-themes '(spacemacs-dark) ;; Set Spacemacs theme
        dotspacemacs-colorize-cursor-according-to-state t



        ;; Font config
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        dotspacemacs-default-font '("Source Code Pro"
                                       :size 14
                                       :weight normal
                                       :width normal
                                       :powerline-scale 1.1)
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; Font config



        ;; Evil mode
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        dotspacemacs-leader-key "SPC" ;; The evil leader key
        dotspacemacs-emacs-command-key "SPC" ;; The key used for Vim Ex commands (default ":")
        dotspacemacs-ex-command-key ":" ;; The leader key accessible in `emacs state' and `insert state'
        dotspacemacs-emacs-leader-key "M-m" ;; The emacs leader key
        dotspacemacs-major-mode-leader-key "," ;; Major mode leader key accessible in `emacs state' and `insert state'.
        dotspacemacs-major-mode-emacs-leader-key "C-M-m"
        ;; These variables control whether separate commands are bound in the GUI to
        ;; the key pairs C-i, TAB and C-m, RET.
        ;; Setting it to a non-nil value, allows for separate commands under <C-i>
        ;; and TAB or <C-m> and RET.
        ;; In the terminal, these pairs are generally indistinguishable, so this only
        ;; works in the GUI. (default nil)
        dotspacemacs-distinguish-gui-tab nil
        ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
        dotspacemacs-remap-Y-to-y$ nil
        ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
        ;; there. (default t)
        dotspacemacs-retain-visual-state-on-shift t
        ;; If non-nil, J and K move lines up and down when in visual mode.
        ;; (default nil)
        dotspacemacs-visual-line-move-text nil
        ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
        ;; (default nil)
        dotspacemacs-ex-substitute-global nil
        ;; Name of the default layout (default "Default")
        dotspacemacs-default-layout-name "Default"
        ;; If non nil the default layout name is displayed in the mode-line.
        ;; (default nil)
        dotspacemacs-display-default-layout nil
        ;; If non nil then the last auto saved layouts are resume automatically upon
        ;; start. (default nil)
        dotspacemacs-auto-resume-layouts nil
        ;; Size (in MB) above which spacemacs will prompt to open the large file
        ;; literally to avoid performance issues. Opening a file literally means that
        ;; no major mode or minor modes are active. (default is 1)
        dotspacemacs-large-file-size 1
        ;; Location where to auto-save files. Possible values are `original' to
        ;; auto-save the file in-place, `cache' to auto-save the file to another
        ;; file stored in the cache directory and `nil' to disable auto-saving.
        ;; (default 'cache)
        dotspacemacs-auto-save-file-location 'cache
        ;; Maximum number of rollback slots to keep in the cache. (default 5)
        dotspacemacs-max-rollback-slots 5
        ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
        dotspacemacs-helm-resize nil
        ;; if non nil, the helm header is hidden when there is only one source.
        ;; (default nil)
        dotspacemacs-helm-no-header nil
        ;; define the position to display `helm', options are `bottom', `top',
        ;; `left', or `right'. (default 'bottom)
        dotspacemacs-helm-position 'bottom
        ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
        ;; in all non-asynchronous sources. If set to `source', preserve individual
        ;; source settings. Else, disable fuzzy matching in all sources.
        ;; (default 'always)
        dotspacemacs-helm-use-fuzzy 'always
        ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
        ;; several times cycle between the kill ring content. (default nil)
        dotspacemacs-enable-paste-transient-state nil
        ;; Which-key delay in seconds. The which-key buffer is the popup listing
        ;; the commands bound to the current keystroke sequence. (default 0.4)
        dotspacemacs-which-key-delay 0.4
        ;; Which-key frame position. Possible values are `right', `bottom' and
        ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
        ;; right; if there is insufficient space it displays it at the bottom.
        ;; (default 'bottom)
        dotspacemacs-which-key-position 'bottom
        ;; If non nil a progress bar is displayed when spacemacs is loading. This
        ;; may increase the boot time on some systems and emacs builds, set it to
        ;; nil to boost the loading time. (default t)
        dotspacemacs-loading-progress-bar t
        ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
        ;; (Emacs 24.4+ only)
        dotspacemacs-fullscreen-at-startup nil
        ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
        ;; Use to disable fullscreen animations in OSX. (default nil)
        dotspacemacs-fullscreen-use-non-native nil
        ;; If non nil the frame is maximized when Emacs starts up.
        ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
        ;; (default nil) (Emacs 24.4+ only)
        dotspacemacs-maximized-at-startup nil
        ;; A value from the range (0..100), in increasing opacity, which describes
        ;; the transparency level of a frame when it's active or selected.
        ;; Transparency can be toggled through `toggle-transparency'. (default 90)
        dotspacemacs-active-transparency 90
        ;; A value from the range (0..100), in increasing opacity, which describes
        ;; the transparency level of a frame when it's inactive or deselected.
        ;; Transparency can be toggled through `toggle-transparency'. (default 90)
        dotspacemacs-inactive-transparency 90
        ;; If non nil show the titles of transient states. (default t)
        dotspacemacs-show-transient-state-title t
        ;; If non nil show the color guide hint for transient state keys. (default t)
        dotspacemacs-show-transient-state-color-guide t
        ;; If non nil unicode symbols are displayed in the mode line. (default t)
        dotspacemacs-mode-line-unicode-symbols t
        ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
        ;; scrolling overrides the default behavior of Emacs which recenters point
        ;; when it reaches the top or bottom of the screen. (default t)
        dotspacemacs-smooth-scrolling t
        ;; Control line numbers activation.
        ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
        ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
        ;; This variable can also be set to a property list for finer control:
        ;; '(:relative nil
        ;;   :disabled-for-modes dired-mode
        ;;                       doc-view-mode
        ;;                       markdown-mode
        ;;                       org-mode
        ;;                       pdf-view-mode
        ;;                       text-mode
        ;;   :size-limit-kb 1000)
        ;; (default nil)
        dotspacemacs-line-numbers t
        ;; Code folding method. Possible values are `evil' and `origami'.
        ;; (default 'evil)
        dotspacemacs-folding-method 'evil
        ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
        ;; (default nil)
        dotspacemacs-smartparens-strict-mode nil
        ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
        ;; over any automatically added closing parenthesis, bracket, quote, etc…
        ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
        dotspacemacs-smart-closing-parenthesis nil
        ;; Select a scope to highlight delimiters. Possible values are `any',
        ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
        ;; emphasis the current one). (default 'all)
        dotspacemacs-highlight-delimiters 'all
        ;; If non nil, advise quit functions to keep server open when quitting.
        ;; (default nil)
        dotspacemacs-persistent-server nil
        ;; List of search tool executable names. Spacemacs uses the first installed
        ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
        ;; (default '("ag" "pt" "ack" "grep"))
        dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
        ;; The default package repository used if no explicit repository has been
        ;; specified with an installed package.
        ;; Not used for now. (default nil)
        dotspacemacs-default-package-repository nil
        ;; Delete whitespace while saving buffer. Possible values are `all'
        ;; to aggressively delete empty line and long sequences of whitespace,
        ;; `trailing' to delete only the whitespace at end of lines, `changed'to
        ;; delete only whitespace for changed lines or `nil' to disable cleanup.
        ;; (default nil)
        dotspacemacs-whitespace-cleanup nil
        )
    )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Spacemacs init









;; User init
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun dotspacemacs/user-init ()
    (push "/usr/local/share/emacs/site-lisp/rtags" load-path)
    (add-to-list 'load-path "~/.emacs.d/elpa/project-run") ;; Add project-run to available packages
    (require 'project-run) ;; Install project-run
    )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; User init










;; User config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun dotspacemacs/user-config ()
    ;; Set tab offset and indentation style
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (setq c-basic-offset 4)
    (setq c-default-style "bsd")
    (setq coffee-tab-width 4) ; coffeescript
    (setq javascript-indent-level 4) ; javascript-mode
    (setq js-indent-level 4) ; js-mode
    (setq js2-basic-offset 4) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
    (setq web-mode-markup-indent-offset 4) ; web-mode, html tag in html file
    (setq web-mode-css-indent-offset 4) ; web-mode, css in html file
    (setq web-mode-code-indent-offset 4) ; web-mode, js code in html file
    (setq css-indent-offset 4) ; css-mode
    (setq lisp-body-indent 4) ; lisp indentation
    (setq lisp-indent-offset 4) ; lisp indentation
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Set tab offset indentation style


    ;; LaTeX and PDF settings
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (setq TeX-parse-self t) ;; Enable parse on load.
    (setq TeX-auto-save t) ;; Enable parse on save.
    (setq org-latex-pdf-process '("latexmk -pdflatex='pdflatex -interaction nonstopmode' -pdf -bibtex -f %f")) ;; Set LaTeX compile command
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; LaTeX and PDF settings



    ;; setq
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (setq window-numbering-assign-func (lambda () (when (equal (buffer-name) "*Calculator*") 9))) ;; Window numbering

    (setq neo-theme 'icons) ;; Set Neotree theme to icons

    (setq evil-emacs-state-cursor '("chartreuse3" (bar . 2))) ;; Set cursor shape


    (delete-selection-mode) ;; Overwrite selected text

    (global-company-mode) ;; Enable company mode globally

    (windmove-default-keybindings 'meta) ;; Switching windows with arrows

    (put 'web-mode 'flyspell-mode-predicate 'web-mode-flyspefll-verify)

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; setq



    ;; add-hook
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (add-hook 'c++-mode-hook
        (lambda ()
            (local-set-key [f5] 'projectile-compile-project)
            (local-set-key [f6] 'run-file)
            ))

    (add-hook 'LaTeX-mode-hook
        (lambda ()
            (local-set-key [f5] 'latex/build)
            (local-set-key [f6] 'TeX-view)
            ))

    (add-hook 'web-mode-hook
        (lambda ()
            (flyspell-mode 1)
            ))

    (add-hook 'doc-view-mode-hook
        'auto-revert-mode
        )
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; add-hook



    ;; defun
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (defun web-mode-flyspefll-verify ()
        (let ((f (get-text-property (- (point) 1) 'face)))
            (not (memq f '(web-mode-html-attr-value-face
                              web-mode-html-tag-face
                              web-mode-html-attr-name-face
                              web-mode-doctype-face
                              web-mode-keyword-face
                              web-mode-function-name-face
                              web-mode-variable-name-face
                              web-mode-css-property-name-face
                              web-mode-css-selector-face
                              web-mode-css-color-face
                              web-mode-type-face
                              )
                     ))))

    (defun FunctionKey7 ()
        'neotree
        'flycheck-list-errors
         )
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;; defun



		;; Keybindings
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		(global-set-key [f7] 'neotree) ;; Set Neotree toggle key to F7
		(global-set-key [f8] 'save-buffers-kill-terminal) ;; Exit Emacs
		(global-set-key [f9] 'restart-emacs) ;; Restart Emacs
		(global-set-key (kbd "C-RET") 'term)
		(global-set-key (kbd "C-<return>") 'term)
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;; Keybindings

    )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; User config










;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
    '(ansi-color-names-vector
         ["#080808" "#d70000" "#67b11d" "#875f00" "#268bd2" "#af00df" "#00ffff" "#b2b2b2"])
    '(custom-safe-themes
         (quote
             ("04589c18c2087cd6f12c01807eed0bdaa63983787025c209b89c779c61c3a4c4" "d74fe1508cff43708fa2f97c4bf58d19f0e002b2e0c92bf958bf483113b7d89d" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "b44f201f67425ece29e34972be12917189cac2bac90e3e35d3160bce211d3199" "47ec21abaa6642fefec1b7ace282221574c2dd7ef7715c099af5629926eb4fd7" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "8a97050c9dd0af1cd8c3290b061f4b6032ccf2044ddc4d3c2c39e516239b2463" "72085337718a3a9b4a7d8857079aa1144ea42d07a4a7696f86627e46ac52f50b" "8dce5b23232d0a490f16d62112d3abff6babeef86ae3853241a85856f9b0a6e7" "450f3382907de50be905ae8a242ecede05ea9b858a8ed3cc8d1fbdf2d57090af" "4138944fbed88c047c9973f68908b36b4153646a045648a22083bd622d1e636d" "1dd7b369ab51f00e91b6a990634017916e7bdeb64002b4dda0d7a618785725ac" "621595cbf6c622556432e881945dda779528e48bb57107b65d428e61a8bb7955" "cd7ffd461946d2a644af8013d529870ea0761dccec33ac5c51a7aaeadec861c2" "54f2d1fcc9bcadedd50398697618f7c34aceb9966a6cbaa99829eb64c0c1f3ca" "2642a1b7f53b9bb34c7f1e032d2098c852811ec2881eec2dc8cc07be004e45a0" "bf5bdab33a008333648512df0d2b9d9710bdfba12f6a768c7d2c438e1092b633" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(ecb-options-version "2.50")
 '(evil-want-Y-yank-to-eol nil)
    '(package-selected-packages
         (quote
             (ecb tabbar web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern tern coffee-mode flyspell-popup gotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme vscode-icon dakrmine-theme all-the-icons memoize commander omnisharp csharp-mode stickyfunc-enhance srefactor typit mmt sudoku pacmacs dash-functional 2048-game window-numbering org-ref pdf-tools key-chord ivy tablist helm-bibtex parsebib biblio biblio-core company-auctex auctex company-quickhelp web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download magit-gitflow magit-popup htmlize helm-gitignore gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit transient el-autoyas yasnippet-snippets auto-complete-clang auto-complete-c-headers auto-complete-auctex xterm-color unfill shell-pop mwim multi-term mmm-mode markdown-toc markdown-mode helm-company helm-c-yasnippet git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-commit with-editor git-gutter gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck eshell-z eshell-prompt-extras esh-help diff-hl company-statistics company-c-headers company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete atom-dark-theme atom-one-dark-theme disaster cmake-mode clang-format ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
    '(safe-local-variable-values
         (quote
             ((projectile-project-compilation-cmd . "make")
                 (projectile-project-test-cmd . "make && ./output")
                 (projectile-project-run-cmd . "./output"))))
 '(tabbar-separator (quote (0.5))))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
