defmodule HelloText.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    {:ok, model_info} =
      Bumblebee.load_model({:hf, "finiteautomata/bertweet-base-emotion-analysis"})

    {:ok, tokenizer} = Bumblebee.load_tokenizer({:hf, "vinai/bertweet-base"})

    serving =
      Bumblebee.Text.text_classification(model_info, tokenizer,
        top_k: 1,
        compile: [batch_size: 4, sequence_length: 100],
        defn_options: [compiler: EXLA]
      )

    children = [
      {Nx.Serving, serving: serving, name: MyTextClassification.Serving, batch_timeout: 500}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloText.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
