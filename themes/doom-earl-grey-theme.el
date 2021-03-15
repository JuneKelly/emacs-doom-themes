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
   (base0      '("#F7F3EE" "black"   "black"))
   (base1      '("#E9E5E0" "black" "brightblack"))
   (base2      '("#DCD7D2" "black" "brightblack"))
   (base3      '("#CEC9C3" "black" "brightblack"))
   (base4      '("#A19A91" "black" "brightblack"))
   (base5      '("#B2ADA7" "black" "brightblack"))
   (base6      '("#89847D" "black" "brightblack"))
   (base7      '("#6E6860" "black" "brightblack"))
   (base8      '("#605A52" "black" "white"))
   (fg         '("#605A52" "black" "white"))
   (fg-alt     '("#97928B" "black" "brightwhite"))

   ;; TODO: middle colors
   (grey base3)
   (red       '("#975555" "black" "red"))
   (orange    '("#A1712E" "black" "brightred"))
   (green     '("#727F55" "black" "green"))
   (teal      '("#518082" "black" "brightgreen"))
   (yellow    '("#A1712E" "black" "yellow"))
   (blue      '("#5B6D91" "black" "brightblue"))
   (dark-blue '("#5B6D91" "black" "blue"))
   (magenta   '("#805980" "black" "magenta"))
   (violet    '("#805980" "black" "brightmagenta"))
   (cyan      '("#398EAC" "black" "brightcyan"))
   (dark-cyan '("#2C7088" "black" "cyan"))

   ;; face categories -- required for all themes
   (highlight (doom-lighten blue 0.1))
   (vertical-bar (doom-darken bg 0.15))
   (selection (doom-blend magenta bg 0.4))
   (builtin fg)
   (comments (if doom-earl-grey-brighter-comments
                 grey
                 (doom-darken grey 0.2)))
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
        (doom-darken base2 0.05)
      base1))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken base2 0.1)
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
    :foreground comments ; TODO: Check this works
    :background (if doom-earl-grey-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)
    (font-lock-comment-delimiter-face    :inherit font-lock-comment-face)
    (font-lock-builtin-face              :foreground fg
                                         :inherit 'italic :extend t)
    (font-lock-type-face                 :inherit 'default)
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
    (which-key-key-face                   :foreground blue)
    (which-key-group-description-face     :foreground magenta)
    (which-key-command-description-face   :foreground fg)
    (which-key-local-map-description-face :foreground orange)
    (which-key-separator-face             :background bg-alt
                                          :foreground comments)

    ;; highlight-numbers-mode
    (highlight-numbers-number :foreground teal
                              :weight 'semi-bold)

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

    ; TODO: check line highlight is same as others, projectile, etc
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
                         :background (doom-blend bg orange 0.85)
                         :foreground orange
                         :weight 'bold)
    (swiper-background-match-face-2 :inherit 'unspecified
                         :background (doom-blend bg orange 0.95)
                         :foreground orange
                         :weight 'bold)
    (swiper-match-face-3 :inherit 'unspecified
                         :background (doom-blend bg green 0.85)
                         :foreground green
                         :weight 'bold)
    (swiper-background-match-face-3 :inherit 'unspecified
                         :background (doom-blend bg green 0.95)
                         :foreground green
                         :weight 'bold)
    (swiper-match-face-4 :inherit 'unspecified
                         :background (doom-blend bg teal 0.85)
                         :foreground teal
                         :weight 'bold)
    (swiper-background-match-face-4 :inherit 'unspecified
                         :background (doom-blend bg teal 0.95)
                         :foreground teal
                         :weight 'bold)

   ;; TODO:
   ;;   - Git
   ;;   - completion list / company
   ;;   - dashboard
   ;;   - swiper

   ((region &override)
    :foreground fg)

   ((lazy-highlight &override) :background (doom-blend bg blue 0.78))
   ((line-number &override) :foreground (doom-lighten 'base5 0.2))
   ((line-number-current-line &override) :foreground base7)
   ((paren-face-match &override) :foreground red :background base3 :weight 'ultra-bold)
   ((paren-face-mismatch &override) :foreground base3 :background red :weight 'ultra-bold)
   ((vimish-fold-overlay &override) :inherit 'font-lock-comment-face :background base3 :weight 'light)
   ((vimish-fold-fringe &override) :foreground teal)

   ;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   (magit-diff-hunk-heading-highlight :foreground bg :background blue :weight 'bold)
   (magit-diff-hunk-heading :foreground bg :background (doom-blend blue bg 0.3))
   (ivy-posframe :background (doom-blend blue bg 0.2))
   (ivy-virtual :foreground (doom-blend blue bg 0.8))
   (ivy-minibuffer-match-face-1 :background nil :foreground (doom-blend fg bg 0.5) :weight 'light)
   (internal-border :foreground (doom-blend blue bg 0.2) :background (doom-blend blue bg 0.2))
   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property :foreground green)
   (css-selector :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))

   (nav-flash-face :background region :foreground fg :weight 'bold)
   ;; org-mode
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden)

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


   ;; End
   )

  ;; --- extra variables ---------------------
  ()
  )

;;; doom-earl-grey-theme.el ends here
