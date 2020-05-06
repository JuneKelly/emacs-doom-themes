;;; doom-ft-theme.el --- inspired by Atom One Light -*- no-byte-compile: t; -*-
(require 'doom-themes)

;;
(defgroup doom-ft-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-ft-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-ft-theme
  :type 'boolean)

(defcustom doom-ft-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-ft-theme
  :type 'boolean)

(defcustom doom-ft-comment-bg doom-ft-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-ft-theme
  :type 'boolean)

(defcustom doom-ft-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-ft-theme
  :type '(choice integer boolean))

; primary
(setq ft-paper  '("#fff1e5" "#ffffcc" "white"))       ; main bg
(setq ft-black  '("#000000" "#000000" "brightblack")) ; variable
(setq ft-white  '("#ffffff" "#ffffff" "brightblack")) ;
(setq ft-claret '("#990f3d" "#990033" "brightblack")) ; keyword
(setq ft-oxford '("#0f5499" "#006699" "brightblack")) ; function name & type
(setq ft-teal   '("#0d7680" "#006699" "brightblack")) ; builtin


; secondary
(setq ft-wheat    '("#f2dfce" "#ffcccc" "brightblack")) ;
(setq ft-sky      '("#cce6ff" "#ccffff" "brightblack")) ;
(setq ft-slate    '("#262a33" "#333333" "brightblack")) ; main fg
(setq ft-velvet   '("#593380" "#663399" "brightblack")) ; constant
(setq ft-mandarin '("#ff8833" "#ff9933" "brightblack")) ; warning 2
(setq ft-lemon    '("#ffec1a" "#ffff33" "brightblack")) ;

; tertiary
(setq ft-jade    '("#00994d" "#009966" "brightblack")) ; string
(setq ft-wasabi  '("#96cc28" "#99cc33" "brightblack")) ;
(setq ft-crimson '("#cc0000" "#cc0000" "brightblack")) ; warning
(setq ft-candy   '("#ff7faa" "#ff6699" "brightblack")) ;

; b2c
(setq ft-org-b2c       '("#4e96eb" "#6699ff" "brightblack")) ;
(setq ft-org-b2c-dark  '("#3a70af" "#336699" "brightblack")) ;
(setq ft-org-b2c-light '("#99c6fb" "#99ccff" "brightblack")) ;

;;
(def-doom-theme doom-ft
  "A light theme inspired by the FT"

  ;; name        default   256       16
  ((bg         ft-paper)
   (bg-alt     (doom-darken ft-paper 0.05))
   (base0      bg-alt)
   (base1      (doom-darken base0 0.05))
   (base2      (doom-darken base1 0.05))
   (base3      (doom-darken base2 0.05))
   (base4      '("#9ca0a4" "#9ca0a4" "brightblack"  ))
   (base5      '("#383a42" "#424242" "brightblack"  ))
   (base6      '("#202328" "#2e2e2e" "brightblack"  ))
   (base7      '("#1c1f24" "#1e1e1e" "brightblack"  ))
   (base8      '("#1b2229" "black"   "black"        ))
   (fg         ft-slate)
   (fg-alt     '("#c6c7c7" "#c7c7c7" "brightblack"  ))

   (grey       base4)
   (red        ft-claret)
   (orange     ft-mandarin)
   (green      ft-jade)
   (teal       ft-teal)
   (yellow     ft-mandarin)
   (blue       ft-org-b2c-dark)
   (dark-blue  ft-oxford)
   (magenta    ft-velvet)
   (violet     (doom-darken ft-candy 0.3))
   (cyan       ft-org-b2c-dark)
   (dark-cyan  (doom-darken ft-org-b2c-dark 0.1))

   ;; face categories -- required for all themes
   (highlight      cyan )
   (vertical-bar   (doom-darken base2 0.1))
   (selection      dark-blue)
   (builtin        teal)
   (comments       (if doom-ft-brighter-comments cyan base4))
   (doc-comments   (doom-darken comments 0.15))
   (constants      magenta)
   (functions      dark-blue)
   (keywords       red)
   (methods        red)
   (operators      ft-black)
   (type           dark-blue)
   (strings        green)
   (variables      ft-black)
   (numbers        magenta)
   (region         `(,(doom-darken (car bg-alt) 0.1) ,@(doom-darken (cdr base0) 0.3)))
   (error          ft-crimson)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (-modeline-bright doom-ft-brighter-modeline)
   (-modeline-pad
    (when doom-ft-padded-modeline
      (if (integerp doom-ft-padded-modeline) doom-ft-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt (doom-blend violet base4 (if -modeline-bright 0.5 0.2)))

   (modeline-bg
    (if -modeline-bright
        (doom-darken base1 0.05)
      base1))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken base1 0.1)
      base1))
   (modeline-bg-inactive (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(doom-darken (car bg-alt) 0.05) ,@(cdr base1))))

  ;; --- extra faces ------------------------
  (;(highlight :background blue :foreground ft-wheat)
   (centaur-tabs-unselected :background bg-alt :foreground base4)
   (font-lock-comment-face
    :foreground comments
    :background (if doom-ft-comment-bg base0))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments
    :slant 'italic)

   ((line-number &override) :foreground (doom-lighten base4 0.15))
   ((line-number-current-line &override) :foreground base8)

   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; magit
   (magit-blame-heading     :foreground orange :background bg-alt)
   (magit-diff-removed :foreground (doom-darken red 0.2) :background (doom-blend red bg 0.1))
   (magit-diff-removed-highlight :foreground red :background (doom-blend red bg 0.2) :bold bold)

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face     :foreground base5)
   (markdown-header-face     :inherit 'bold :foreground red)
   ((markdown-code-face &override)       :background base1)
   (mmm-default-submode-face :background base1)

   ;; org-mode
   ((outline-1 &override) :foreground red)
   ((outline-2 &override) :foreground orange)
   ((org-block &override) :background base1)
   ((org-block-begin-line &override) :foreground fg :slant 'italic)
   (org-ellipsis :underline nil :background bg     :foreground red)
   ((org-quote &override) :background base1)

   ;; js2-mode
   (js2-object-property :foreground teal)
   (js2-object-property-access :foreground dark-blue)

   ;; helm
   (helm-candidate-number :background blue :foreground bg)

   ;; web-mode
   (web-mode-current-element-highlight-face :background dark-blue :foreground bg)

   ;; wgrep
   (wgrep-face :background base1)

   ;; ediff
   (ediff-current-diff-A        :foreground red   :background (doom-lighten red 0.8))
   (ediff-current-diff-B        :foreground green :background (doom-lighten green 0.8))
   (ediff-current-diff-C        :foreground blue  :background (doom-lighten blue 0.8))
   (ediff-current-diff-Ancestor :foreground teal  :background (doom-lighten teal 0.8))

   ;; tooltip
   (tooltip :background base1 :foreground fg)

   ;; posframe
   (ivy-posframe               :background base0)

   ;; evil
   ;; TODO: re-use vars properly
   (evil-ex-search          :background cyan :foreground "#fff1e5")
   (evil-ex-lazy-highlight  :background cyan :foreground "#ffffff" )

   ;; I-search
   (match                                        :foreground fg :background bg-alt)
   (isearch                                      :inherit 'match :box `(:line-width 2 :color ,dark-cyan))
   (lazy-highlight                               :inherit 'match)
   (isearch-fail                                 :foreground red)
   ;; swiper
   (swiper-background-match-face-1               :inherit 'match :bold bold)
   (swiper-background-match-face-2               :inherit 'match)
   (swiper-background-match-face-3               :inherit 'match :foreground green)
   (swiper-background-match-face-4               :inherit 'match :bold bold :foreground green)
   (swiper-match-face-1                          :inherit 'isearch :bold bold)
   (swiper-match-face-2                          :inherit 'isearch)
   (swiper-match-face-3                          :inherit 'isearch :foreground green)
   (swiper-match-face-4                          :inherit 'isearch :bold bold :foreground green)
   (swiper-line-face                             :inherit 'hl-line)

   ;; lsp
   (lsp-ui-doc-background      :background base0)
   (lsp-face-highlight-read    :background (doom-blend red bg 0.3))
   (lsp-face-highlight-textual :inherit 'lsp-face-highlight-read)
   (lsp-face-highlight-write   :inherit 'lsp-face-highlight-read)
   )

  ;; --- extra variables ---------------------
  ()
  )

;;; doom-ft-theme.el ends here
