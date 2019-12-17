(ns atp)
(import
 '(java.io File)
 '(java.io FileOutputStream)
 '(java.util Properties))

(require '[clojure-erlastic.core :refer [run-server log]])

(use  '[clojure.string :only [trim]]
      '[clojure.core.match :only (match)])

(defn hello_world
  "Return a basic hello world"
  [] "hello world")

(match
 (run-server
  (fn [_] "init")
  (fn [term destination] (match term
                                [:echo ] [:reply (hello_world) destination]))
  {:str-detect :all})
 [:error e] (do (log e) (System/exit 1))
 :normal :ok)
