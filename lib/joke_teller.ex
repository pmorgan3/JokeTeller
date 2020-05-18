defmodule JokeTeller do
  require HTTPoison

  def main(_args) do
    JokeTeller.joke()
  end
  def joke do
    HTTPoison.start
    url = "https://sv443.net/jokeapi/v2/joke/Programming?type=twopart"
    case HTTPoison.get(url, ["Accept": "Application/json; Charset=utf-8"], [ssl: [{:versions, [:'tlsv1.2']}]]) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {_status, list} =
          body
          |> HTTPoison.process_response_body
          |> JSON.decode
        IO.puts list["setup"]
        IO.puts list["delivery"]
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts "Error"
        IO.inspect reason
    end
  end
end
