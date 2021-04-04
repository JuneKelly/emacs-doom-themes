;;; doom-earl-grey-theme.el --- inspired by Nord -*- no-byte-compile: t; -*-
(require 'doom-themes)

;;
(defgroup doom-earl-grey-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-earl-grey-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-earl-grey-theme
  :type 'boolean)

(defcustom doom-earl-grey-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-earl-grey-theme
  :type 'boolean)

(defcustom doom-earl-grey-comment-bg doom-earl-grey-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-earl-grey-theme
  :type 'boolean)

(defcustom doom-earl-grey-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-earl-grey-theme
  :type '(choice integer boolean))

;;
(def-doom-theme doom-earl-grey
  "A gentle color scheme for code."

  ;; name        default   256       16
  ((bg         '("#FCFBF9" nil       nil))
   (bg-alt     '("#F7F3EE" nil       nil))
   (base0      '("#F7F3EE" "white"   "white"))
   (base1      '("#E6E2DD" "#E4E4E4" "brightblack"))
   (base2      '("#D5D1CB" "#D0D0D0" "brightblack"))
   (base3      '("#C5C0BA" "#C6C6C6" "brightblack"))
   (base4      '("#B4AFA9" "#B2B2B2" "brightblack"))
   (base5      '("#A39E97" "#A8A8A8" "brightblack"))
   (base6      '("#928D86" "#949494" "brightblack"))
   (base7      '("#827C75" "#808080" "brightblack"))
   (base8      '("#767068" "#767676" "black"))
   (fg         '("#605A52" "#626262" "black"))
   (fg-alt     '("#97928B" "#949494" "brightblack"))

   (grey base4)
   (red       '("#975555" "#870000" "red"))
   (orange    '("#A1712E" "#875F00" "brightred"))
   (green     '("#727F55" "#5F875F" "green"))
   (teal      '("#518082" "#87AFAF" "brightgreen"))
   (yellow    '("#A1712E" "875F00" "yellow"))
   (blue      '("#5B6D91" "#5F87AF" "brightblue"))
   (dark-blue '("#5B6D91" "#5F87AF" "blue"))
   (magenta   '("#805980" "#875FAF" "magenta"))
   (violet    '("#805980" "#875FAF" "brightmagenta"))
   (cyan      '("#398EAC" "#87D7D7" "brightcyan"))
   (dark-cyan '("#2C7088" "#87AFAF" "cyan"))

   ;; face categories -- required for all themes
   (highlight (doom-lighten blue 0.1))
   (vertical-bar (doom-darken bg 0.15))
   (selection (doom-blend magenta bg 0.4))
   (builtin fg)
   (comments (if doom-earl-grey-brighter-comments
                 base6
                 grey))
   (doc-comments comments)
   (constants teal)
   (functions fg)
   (keywords magenta)
   (methods fg)
   (operators fg)
   (type magenta)
   (strings green)
   (variables blue)
   (numbers teal)
   (region base1)
   (error red)
   (warning yellow)
   (success green)
   (vc-modified orange)
   (vc-added green)
   (vc-deleted red)

   ;; custom categories
   (hidden `(,(car bg) "black" "black"))
   (-modeline-bright doom-earl-grey-brighter-modeline)
   (-modeline-pad
    (when doom-earl-grey-padded-modeline
      (if (integerp doom-earl-grey-padded-modeline)
          doom-earl-grey-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt base4)

   (modeline-bg
    (if -modeline-bright
        base2
      base1))
   (modeline-bg-l
    (if -modeline-bright
        base3
      base2))
   (modeline-bg-inactive (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(doom-darken (car bg-alt) 0.05) ,@(cdr base1))))

  ;; --- extra faces ------------------------
  ((default :background bg :foreground fg)

   ;; Modeline
   (doom-modeline-buffer-path       :foreground blue)
   (doom-modeline-buffer-major-mode :inherit 'doom-modeline-buffer-path
                                    :bold 'bold)
   (doom-modeline-info              :foreground green)
   (doom-modeline-project-dir       :foreground magenta)
   (doom-modeline-evil-insert-state :foreground teal)
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))
   (doom-modeline-project-root-dir :foreground base6)

   ;; solaire
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; Font-Lock
   (font-lock-comment-face
    :foreground comments
    :background (if doom-earl-grey-comment-bg base1))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)
    (font-lock-comment-delimiter-face    :inherit font-lock-comment-face)
    (font-lock-builtin-face              :foreground fg
                                         :inherit 'italic :extend t)
    (font-lock-type-face                 :foreground fg
                                         :inherit 'italic :extend t)
    (font-lock-variable-name-face        :foreground blue)
    (font-lock-warning-face              :foreground red)
    (font-lock-negation-char-face        :inherit 'default)
    (font-lock-preprocessor-face         :inherit 'default)
    (font-lock-preprocessor-char-face    :inherit 'default)
    (font-lock-regexp-grouping-backslash :inherit 'default)
    (font-lock-regexp-grouping-construct :inherit 'default)
    (font-lock-constant-face             :foreground teal)
    (font-lock-function-name-face        :foreground fg
                                         :inherit 'italic :extend t)

    ;; makefile-*-mode
    (makefile-targets :foreground magenta)

    ;; which-key
    (which-key-key-face                   :foreground (doom-blend bg-alt magenta 0.1))
    (which-key-group-description-face     :foreground (doom-blend bg-alt blue 0.1))
    (which-key-command-description-face   :foreground fg)
    (which-key-local-map-description-face :foreground orange)
    (which-key-separator-face             :background bg-alt
                                          :foreground comments)

    ;; highlight-numbers-mode
    (highlight-numbers-number :foreground teal)

    ;; web-mode
    (web-mode-doctype-face           :foreground comments)
    (web-mode-html-tag-face          :foreground magenta)
    (web-mode-html-attr-name-face    :foreground fg
                                     :inherit 'italic)
    (web-mode-html-attr-value-face   :inherit 'font-lock-string-face)
    (web-mode-html-entity-face       :foreground orange
                                     :inherit 'italic)
    (web-mode-block-control-face     :foreground base1)
    (web-mode-html-tag-bracket-face  :foreground fg-alt)
    (web-mode-symbol-face            :foreground blue)
    (web-mode-string-face            :inherit 'font-lock-string-face)
    (web-mode-current-element-highlight-face :foreground bg)

    ;; rjsx-mode
    (rjsx-tag  :foreground magenta)
    (rjsx-text :inherit 'default)
    (rjsx-tag-bracket-face :foreground fg-alt)
    (rjsx-attr :foreground fg
               :inherit 'italic)

    ;; highlight-quoted-mode
    (highlight-quoted-symbol :foreground blue)
    (highlight-quoted-quote  :foreground teal)

    ;; rainbow-delimiters
    (rainbow-delimiters-depth-1-face :foreground (doom-blend bg blue 0.25))
    (rainbow-delimiters-depth-2-face :foreground (doom-blend bg magenta 0.25))
    (rainbow-delimiters-depth-3-face :foreground (doom-blend bg green 0.25))
    (rainbow-delimiters-depth-4-face :foreground (doom-blend bg orange 0.25))
    (rainbow-delimiters-depth-5-face :foreground (doom-blend bg teal 0.25))
    (rainbow-delimiters-depth-6-face :foreground (doom-blend bg red 0.25))
    (rainbow-delimiters-depth-7-face :foreground (doom-blend bg green 0.25))
    (rainbow-delimiters-unmatched-face  :foreground red
                                        :weight 'bold
                                        :inverse-video t)
    (rainbow-delimiters-mismatched-face :inherit 'rainbow-delimiters-unmatched-face)

    ;; swiper
    (swiper-line-face    :background  base1
                         :foreground fg)
    (swiper-match-face-1 :inherit 'unspecified
                         :background  base1
                         :foreground fg
                         :weight 'bold)
    (swiper-background-match-face-1 :inherit 'unspecified
                         :background  bg-alt
                         :foreground fg
                         :weight 'bold)
    (swiper-match-face-2 :inherit 'unspecified
                         :background (doom-blend bg magenta 0.85)
                         :foreground magenta
                         :weight 'bold)
    (swiper-background-match-face-2 :inherit 'unspecified
                         :background (doom-blend bg magenta 0.95)
                         :foreground magenta
                         :weight 'bold)
    (swiper-match-face-3 :inherit 'unspecified
                         :background (doom-blend bg blue 0.85)
                         :foreground blue
                         :weight 'bold)
    (swiper-background-match-face-3 :inherit 'unspecified
                         :background (doom-blend bg blue 0.95)
                         :foreground blue
                         :weight 'bold)
    (swiper-match-face-4 :inherit 'unspecified
                         :background (doom-blend bg orange 0.85)
                         :foreground orange
                         :weight 'bold)
    (swiper-background-match-face-4 :inherit 'unspecified
                         :background (doom-blend bg orange 0.95)
                         :foreground orange
                         :weight 'bold)

    ;; tooltip
    (tooltip :background bg-alt :foreground fg)

    ;; company
    (company-tooltip            :inherit 'tooltip)
    (company-tooltip-annotation            :foreground magenta)
    (company-tooltip-annotation-selection  :foreground magenta )
    (company-tooltip-common                :foreground highlight
                                           :distant-foreground base0
                                           :weight 'bold)
    (company-tooltip-search     :background highlight
                                :foreground bg
                                :distant-foreground fg
                                :weight 'bold)
    (company-tooltip-search-selection :background region)
    (company-tooltip-selection  :background region
                                :weight 'bold)
    (company-tooltip-mouse      :background magenta
                                :foreground bg
                                :distant-foreground fg)
    (company-tooltip-annotation :foreground magenta
                                :distant-foreground bg)
    (company-scrollbar-bg       :inherit 'tooltip)
    (company-scrollbar-fg       :background highlight)
    (company-preview            :foreground comments)
    (company-preview-common     :background base3
                                :foreground highlight)
    (company-preview-search     :inherit 'company-tooltip-search)
    (company-template-field     :inherit 'match)

    ;; company-box
    (company-box-candidate :foreground fg)

   ((region &override)
    :foreground fg)

   ((lazy-highlight &override)
    :background (doom-lighten magenta 0.86)
    :foreground fg)
   ((line-number &override) :foreground (doom-lighten 'base5 0.2))
   ((line-number-current-line &override) :foreground base7)
   ((paren-face-match &override) :foreground red :background base3 :weight 'ultra-bold)
   ((paren-face-mismatch &override) :foreground base3 :background red :weight 'ultra-bold)
   ((vimish-fold-overlay &override) :inherit 'font-lock-comment-face :background base3 :weight 'light)
   ((vimish-fold-fringe &override) :foreground teal)

   ;; parens
   ((show-paren-match &override)
    :background base1)

   ;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ;; Magit
   (magit-diff-hunk-heading-highlight :foreground bg :background blue :weight 'bold)
   (magit-diff-hunk-heading :foreground bg :background (doom-blend blue bg 0.3))
   (magit-blame-heading     :foreground magenta
                            :background base1 :extend t)
   (magit-blame-date       :foreground blue)
   (git-commit-summary :foreground fg)

   ;; Dired
   (diredfl-date-time :foreground blue)
   (diredfl-dir-heading            :foreground magenta :weight 'bold)

   ;; ivy
   (ivy-posframe :background (doom-blend blue bg 0.2))
   (ivy-virtual :foreground (doom-blend blue bg 0.8))
   (ivy-minibuffer-match-face-1 :background nil :foreground (doom-blend fg bg 0.5) :weight 'light)

   (internal-border :foreground (doom-blend blue bg 0.2) :background (doom-blend blue bg 0.2))
   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-property             :foreground fg
                             :inherit 'italic)
   (css-proprietary-property :foreground orange)
   (css-selector             :foreground magenta)
   (web-mode-css-property-name-face :foreground fg)

   ;; markdown-mode
   (markdown-header-face           :inherit 'bold
                                   :foreground magenta)
   (markdown-header-delimiter-face :inherit 'markdown-header-face)
   (markdown-metadata-key-face     :foreground green)
   (markdown-list-face             :foreground fg
                                   :inherit 'bold)
   (markdown-link-face             :foreground blue)
   (markdown-url-face              :foreground blue)
   (markdown-italic-face           :inherit 'italic
                                   :foreground fg)
   (markdown-bold-face             :inherit 'bold
                                   :foreground fg)
   (markdown-markup-face           :foreground fg
                                   :inherit 'bold)
   (markdown-blockquote-face       :inherit 'italic
                                   :foreground doc-comments)
   (markdown-pre-face              :foreground fg)
   (markdown-code-face             :foreground orange
                                   :extend t)
   (markdown-reference-face        :foreground doc-comments)
   (markdown-inline-code-face      :inherit '(markdown-code-face markdown-pre-face)
                                   :extend nil)
   (markdown-html-attr-name-face     :inherit 'font-lock-variable-name-face)
   (markdown-html-attr-value-face    :inherit 'font-lock-string-face)
   (markdown-html-entity-face        :inherit 'font-lock-variable-name-face)
   (markdown-html-tag-delimiter-face :inherit 'markdown-markup-face)
   (markdown-html-tag-name-face      :inherit 'font-lock-keyword-face)

   (nav-flash-face :background region :foreground fg :weight 'bold)

   ;; org-mode
   ((outline-1 &override) :foreground red)
   ((outline-2 &override) :foreground magenta)
   ((outline-3 &override) :foreground orange)
   ((outline-4 &override) :foreground teal)
   ((outline-5 &override) :foreground red)
   ((outline-6 &override) :foreground magenta)
   ((outline-7 &override) :foreground orange)
   ((outline-8 &override) :foreground teal)

   (org-ellipsis :underline nil :background bg     :foreground red)
   ((org-block-begin-line &override)
    :foreground orange
    :background bg-alt
    :weight 'semi-bold
    :extend t)
   ((org-block &override)
    :background bg-alt
    :foreground orange
    :extend t)
   ((org-quote &override)
    :foreground orange
    :background bg-alt
    :extend t)
   ((org-document-title &override)
    :foreground magenta)

   ;; js2-mode
   (js2-function-param    :foreground fg)
   (js2-function-call     :foreground fg )
   (js2-object-property   :foreground fg
                          :inherit 'italic)
   (js2-jsdoc-tag         :foreground doc-comments)
   (js2-external-variable :foreground fg)

   ;; racket
   (racket-keyword-argument-face :foreground orange)
   (racket-selfeval-face :foreground teal)

   ;; clojure
   (clojure-keyword-face :foreground orange)

   ;; elixir
   (elixir-atom-face :foreground blue)
   (elixir-attribute-face :foreground teal)

   ;; lsp
   (lsp-ui-doc-background      :background base0)
   (lsp-face-highlight-read    :inherit 'lazy-highlight)
   (lsp-face-highlight-textual :inherit 'lsp-face-highlight-read)
   (lsp-face-highlight-write   :inherit 'lsp-face-highlight-read)

   ;; doom dashboard
   (doom-dashboard-banner      :foreground comments)
   (doom-dashboard-menu-title  :foreground (doom-blend bg magenta 0.24))
   (doom-dashboard-menu-desc   :foreground (doom-blend bg green 0.24))
   (doom-dashboard-footer-icon :foreground (doom-darken yellow 0.4))
   (doom-dashboard-loaded      :foreground (doom-blend bg orange 0.24))

   ;; End
   )

  ;; --- extra variables ---------------------
  ()
  )

;;; doom-earl-grey-theme.el ends here
