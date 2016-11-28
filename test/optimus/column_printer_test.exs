defmodule Optimus.ColumnPrinterTest do
  use ExUnit.Case

  alias Optimus.ColumnPrinter, as: CP

  test "split ok" do
    assert [{3, "a b"}, {4, "c de"}, {3, "f g"}, {1, "h"}] == CP.split("a b c de f g h", 4)
  end

  def s1 do
    """
    Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.."
    """
  end

  def s2 do
    """
    Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.
    """
  end

  test "format ok" do
    IO.puts ""
    IO.puts ""
    formatted = CP.format([4, {30, :center}, 8, {30, :center}], ["", s1, "", s2])
    for line <- formatted, do: IO.puts(line)

  end


end
