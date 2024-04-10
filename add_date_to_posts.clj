(ns add-date-to-posts
  (:require [babashka.fs :as fs]))

;; get all the files in the `posts` directory
;; parse the date from the file-name and add it as part of the Metadata to the file
(let [posts (fs/list-dir "posts")]
  (doall
    (doseq [post posts]
      (let [file-name (fs/file-name post)
            date (subs file-name 0 10)
            path (str "posts/" file-name)
            content (slurp path)]
        (spit path (str (format "Date: %s\n" date) content))))))

;; remove the `---` for delimiting the metadata headers
;; remove the quotes from the title
;; capitalize the key part of the metadata header -> eg. title: -> Title:

;; change all the posts files to have an .md extension
(let [posts (fs/list-dir "posts")]
  (doall
    (doseq [post posts]
      (let [file-name (fs/file-name post)
            path (str "posts/" file-name)]
        (when (not= "md" (fs/extension file-name))
          (fs/move
            path
            (format "%s.md" (first (fs/split-ext path))))
          #_(println (format "%s.md" (first (fs/split-ext path)))))))))


(let [path "posts/2010-07-09-twittboat-2010.html"]
  (fs/split-ext path))
