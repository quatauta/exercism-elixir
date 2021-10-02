defmodule Markdown do
  @moduledoc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """
  @spec parse(String.t()) :: String.t()
  def parse(markdown) do
    markdown |> String.split("\n") |> Enum.map(fn t -> process(t) end) |> Enum.join() |> patch
  end

  defp process(t) do
    cond do
      String.starts_with?(t, "#") -> t |> parse_header_md_level |> enclose_with_header_tag
      String.starts_with?(t, "*") -> t |> parse_list_md_level
      true -> t |> String.split() |> enclose_with_paragraph_tag
    end
  end

  defp parse_header_md_level(header_with_title) do
    [header | title] = String.split(header_with_title)
    {to_string(String.length(header)), Enum.join(title, " ")}
  end

  defp parse_list_md_level(list) do
    words = list |> String.trim_leading("* ") |> String.split()
    "<li>#{join_words_with_tags(words)}</li>"
  end

  defp enclose_with_header_tag({level, title}) do
    "<h#{level}>#{title}</h#{level}>"
  end

  defp enclose_with_paragraph_tag(text) do
    "<p>#{join_words_with_tags(text)}</p>"
  end

  defp join_words_with_tags(words) do
    words |> Enum.map(fn word -> replace_md_with_tag(word) end) |> Enum.join(" ")
  end

  defp replace_md_with_tag(word) do
    word |> replace_prefix_md |> replace_suffix_md
  end

  defp replace_prefix_md(word) do
    cond do
      word =~ ~r/^#{"__"}{1}/ -> String.replace(word, ~r/^#{"__"}{1}/, "<strong>", global: false)
      word =~ ~r/^[#{"_"}{1}][^#{"_"}+]/ -> String.replace(word, ~r/_/, "<em>", global: false)
      true -> word
    end
  end

  defp replace_suffix_md(word) do
    cond do
      word =~ ~r/#{"__"}{1}$/ -> String.replace(word, ~r/#{"__"}{1}$/, "</strong>")
      word =~ ~r/[^#{"_"}{1}]/ -> String.replace(word, ~r/_/, "</em>")
      true -> word
    end
  end

  defp patch(list) do
    list
    |> String.replace("<li>", "<ul><li>", global: false)
    |> String.replace_suffix("</li>", "</li></ul>")
  end
end
