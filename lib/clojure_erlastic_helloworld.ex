defmodule ClojureErlasticHelloworld do
  use GenServer

  @moduledoc """
  Documentation for ClojureErlasticHelloworld.
  """

  def start_link,
    do:
      GenServer.start_link(
        Exos.Proc,
        {"java -cp  'target/*'  -D'java.library.path=#{:code.priv_dir(:clojure_erlastic_helloworld)}/helloworld' clojure.main bapi.clj",
         "helloworld", [cd: "#{:code.priv_dir(:clojure_erlastic_helloworld)}/helloworld"]},
        name: __MODULE__
      )

  def handle_info({:EXIT, port, _}, port), do: exit(:port_terminated)

  def echo_call() do
    GenServer.call(__MODULE__, {:echo})
  end
end
