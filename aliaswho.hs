import Data.List
import Data.Ord

infixl 9 |>
(|>) = flip (.)

infixl 0 ||>
(||>) = flip ($)

splitCmd :: String -> [String]
splitCmd cmd | cmd /= "" = cmd ||> words |> (scanl1 (\a b -> a ++ ' ':b)) |> (filter (\s -> not $ isSuffixOf "\\" s))

data CmdRecord = CmdRecord { times :: Int, cmd :: String }

main :: IO ()
main = getContents >>= lines |> (filter (not.null)) |> (concatMap splitCmd) |> sort |> group |> (map (\l -> CmdRecord { times = length l, cmd = head l })) |> (sortBy $ comparing (\cr -> - (times cr) * (length $ cmd cr))) |> (map (\cr -> (show $ times cr) ++ "\t" ++ (cmd cr))) |> (map putStrLn) |> sequence_
