param(
    [string]$HtmlPath = (Join-Path $PSScriptRoot 'index.html')
)

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Net.Http

$listingPhotoRows = @'
Madame Plüsch|https://lh3.googleusercontent.com/gps-cs-s/AHRPTWkxoHxETdynCJ_05WKsjecZcxsgg6BMMXSROQmqdxLLE7jrZqSynDH46iHfVhmWb4DFtJTYBd_JPjy1sZ7YdFZ9EOnEPNenLnVcCkoLAayFFv7o_mgKUs2HsW0GKcOU8f7LGgcK=w408-h273-k-no
Gasthaus Zum Schwanen|https://lh3.googleusercontent.com/gps-cs-s/AHRPTWnKSxijhqkIHifyQtA7KOuyTzHHJ6fb97Mz-5BBOf0DCfvcQprliCXliHbknp8YGsd7YpLJVmWeePkCV1TLUY2Uq2npX0I_p_tuEN8augOwDn2FRFt8yPj5x7p7Q8Hohi9XJNET=w426-h240-k-no
Beim Ditsch|https://lh3.googleusercontent.com/gps-cs-s/AHRPTWnPHqsibXuvFxNICtLilLtVepnnyzf5K2mKkAVWFZZNnaTMjpz2tygGabx7jRr3BGwJH9QStf31mLyO3YzwrHGDjcAL3lw6znA5urIB6zSEoBQFdzLpjHz0Lftx0HyQ6UnxbFZ4uoCOyTTo=w408-h544-k-no
Beim Olivenbauer|https://lh3.googleusercontent.com/gps-cs-s/AHRPTWm3gFvx82EV1XK-pIvTXLPVKLy4MVRcWQ9iRsa7_BqGg4DFI3WX-SzpjtB8UTMJoNkqFcvVnkwwY62lOOSE3Q8vsEPOBfP1CfjqSyPFVELQj3ZizpNtRGnArkmiRE9sMkvBaJrReA=w408-h271-k-no
Restaurant Ludwigs|https://lh3.googleusercontent.com/gps-cs-s/AHRPTWkGW-r_wxEZ8J5nwSgNECHhQ4Q8Oy11rTuf5fHnGrCglxFIpbJvQXkKlYzk6nAh5b2W6NrD6bkI7_myo26wNVjQMNxmS6lBSZOpDVOsugqLMNszYAhDnFle6bNXWbAt4zp6oei0Ug=w426-h240-k-no
Mauriz Keller|https://lh3.googleusercontent.com/gps-cs-s/AHRPTWnu_uoUNdvjsGC2cIPhk-6tgeImiAhsfOSBwQqgKAN5ZPzpAwhRxJadmj_1xQlkbc1dgkh0cts4X4VyafCdB9EU9f5dcUFWxRXTWKjbWJQYsyLBsDlr1T8PLoqGZs2mWIK4HLmi=w408-h612-k-no
Cascade Ristorante|https://lh3.googleusercontent.com/gps-cs-s/AHRPTWke3gxJRltoo4LHuFvYwBN4wKIaU2RF3l6ePdrVI5hWTYEa9b0vanglLQ651IZQ-TsgVXijifY4WyfUrAxRIjGMDpm9b-0dQgmrIDbGPtJENoJ6UpYu6wF6EhlzAPrQJlinGABncw=w408-h306-k-no
Vedl Mulin|https://lh3.googleusercontent.com/gps-cs-s/AHRPTWmd_6TBfMpr73_yA9E0AXAlXwnWD99wgYNHV3tef5zV4n6Y2fdgdZDAlX78D-40U7y48sIGEMA82_iy42t10yGo1Vuqv9I87WQdgYaNRH6xqQYk_l2baendErPdWx0gT-MPto6u3w=w426-h240-k-no
Turonda Bistro|https://lh3.googleusercontent.com/gps-cs-s/AHRPTWkvc8wq0fSZ0djeoLj52lLfiwnU1RvPQx02u9CT1EBGXDfaBQ6Qz-1jnl6Kig9uVtFoqtacP6BKbAyNXC6lKFtt8GufDU0Byt76P5lmVuXd0EMk_GG9vKuSkITftRGZaDkrk6Lc=w408-h305-k-no
LaBar Ristorante|https://lh3.googleusercontent.com/gps-cs-s/AHRPTWmv8l8mTQLtQdNz8pn7o4gKotW8zPuFk47vXdRnQu8f-1bMhaQFKqj2TmuyZ5OlEGMInsjyec9a8s9FMP-X23B_4MzFQNgaxmGQpbKZpyg1NyDJ8jHlRXOWNIUKtom-5uwcA9g=w426-h240-k-no
Tschötsch Alm|https://lh3.googleusercontent.com/gps-cs-s/AHRPTWmeN462oq0OgGcGOmpQvh_TGJT8jwLR_YiVnU8HAl7iOhW21bkbBgmzB9eGKmhTbG_6KsFbZ0lB4WopCoINjrs7kvf1CkzS9UFlRD0MZ085cNRBdA2zKZLiZteIeMuc_1rxJfOX=w408-h271-k-no
Huber Schwaige|https://lh3.googleusercontent.com/gps-cs-s/AHRPTWlB-t3ZlJbS0FIoJ6xkmdpfKaLxK_6tBj2b8F6o1VIDJqETVCQ7mJEBTy4jiOeCPa5hgRb0xt08GdCrbOACd9PImvBnS-FBsccGc_HLEri9YXi0iQ4l0jXJPe9nNc1rIg7HGtjy=w408-h306-k-no
Ristorante Alpi|https://lh3.googleusercontent.com/gps-cs-s/AHRPTWkmZJ3QlPxsdqUWAuikUITQE_TR6xW5mvvN0_NEDVlc-Um4j-9KaoUePUPsTOQd0_WUwedHcYNRkeFp_KoSqRQzlBjYBtJ5ip7KnUuDPkmORtdQZBc81vJfDeuzxbUQ9TRuqNtB=w408-h306-k-no
Alpina Chalet|https://lh3.googleusercontent.com/gps-cs-s/AHRPTWnPuaJZAZySNrerIkAfO590orcOvVnLu38NkGyX06K4iZD0fn7uOvodPcTxdTvHNHxZML4NhNCrvRE2rKoiR8ElI5cUSo7ebzn2_oR4GeTwugV4K0ocPDG-4bz9B0pwCEoQxenJEyeWr3E4=w408-h272-k-no
Almgasthof Mont Seuc|https://lh3.googleusercontent.com/gps-cs-s/AHRPTWmX8sgsOmsBdDeo_VuhEB_CrJSQ4SDgNPVQ-hPvCImxty__SOQeqdpUJ49BCnHOOYnZXg2PBofTYOc1pAuo-NGnCsANE5AQGFg1LY9Jw5gMAVW3ruBhdcDGGvn-YhmfvrkKlSuOog=w408-h306-k-no
Winkelkeller|https://lh3.googleusercontent.com/gps-cs-s/AHRPTWngWQeY3kT_AGQIhQsnO4Ft9fGHK33QpkWUq3V_EUOV4slcY72ZUDs-DMx5PtPw2e8WwKIVrU-kYu4dksM_wjyZjT3jhhdAdjxs6KaM1lmSLsdb3yct00zzRlE9x7gdqYL-MTSV6ZxIPxgX=w408-h271-k-no
Schlosskeller|https://lh3.googleusercontent.com/gps-cs-s/AHRPTWkgb2gMBP57fp_ij-lKzPNSvuVpKDFc843y2vBTIEU1FLMoOn3nH0P-EuiDioElabTNUzDAvfbDuincwMKD1LVOQQ1Kxyf1TcikaqeBkj6wfX0hakNXTa1xamNcQjwW-ecU2V0w=w529-h298-k-no
Gasthaus Weber|https://lh3.googleusercontent.com/gps-cs-s/AHRPTWnyGpKYXr7_uDYz0UCrTosJGbGNGSgKAqLuMMWDSmB1DiOuUIhrnGRj4f2mqBDN_ESmT94AWTUpEcnOKrHxAok7ghixYMDIDxFvjA1IankSClXE_vTzXH6-UkxAeZTovD-Qlak=w408-h272-k-no
Kugler Speckstube|https://lh3.googleusercontent.com/gps-cs-s/AHRPTWnYwTvCJQBMTh0WlXOcXyw9bXbhsghHqq_cu91DOvCcuyJykztcR88f2vAg45uoU4_4fnDCpx3qTeT7o5-X9hLuOzqw9k0JjL1qeBPNo8G22FxlJO7vR_ZlCIHLCTVZYLS6Y30rGzn3wPY=w408-h465-k-no
Hans Pizzeria|https://lh3.googleusercontent.com/gps-cs-s/AHRPTWmpgLa7yCQuUqUEqA-euOvNQ--nFdCevwx_RG7ypM6MR701t8zzAatv3xXCB2TXFaXIoOl322EsXDC4FGKf1EGSV0VeVVnvg_YHe1vA2dj8NFcudIkH-EWKtL_510cq8joM4JPp=w408-h306-k-no
'@

$html = [System.IO.File]::ReadAllText($HtmlPath)
$client = New-Object System.Net.Http.HttpClient
$client.DefaultRequestHeaders.UserAgent.ParseAdd('Mozilla/5.0')
$thumbnailPattern = '<div class="res-thumb" style="background-image: url\(''[^'']+''\);"></div>'
$thumbnailMatches = [regex]::Matches($html, $thumbnailPattern)
if ($thumbnailMatches.Count -ne 20) {
    throw "Expected 20 restaurant thumbnails, found $($thumbnailMatches.Count)."
}

try {
    $thumbnailIndex = 0
    foreach ($row in $listingPhotoRows -split "`r?`n") {
        if ([string]::IsNullOrWhiteSpace($row)) { continue }

        $null, $photoUrl = $row -split '\|', 2
        $response = $client.GetAsync($photoUrl).GetAwaiter().GetResult()
        $response.EnsureSuccessStatusCode() | Out-Null
        $mediaType = $response.Content.Headers.ContentType.MediaType
        $bytes = $response.Content.ReadAsByteArrayAsync().GetAwaiter().GetResult()
        $dataUrl = "data:$mediaType;base64,$([Convert]::ToBase64String($bytes))"

        $thumbnailMatches = [regex]::Matches($html, $thumbnailPattern)
        $thumbnailMatch = $thumbnailMatches[$thumbnailIndex]
        $replacement = "<div class=`"res-thumb`" style=`"background-image: url('$dataUrl');`"></div>"
        $html = $html.Substring(0, $thumbnailMatch.Index) + $replacement +
            $html.Substring($thumbnailMatch.Index + $thumbnailMatch.Length)
        $thumbnailIndex++
    }
} finally {
    $client.Dispose()
}

$utf8WithoutBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($HtmlPath, $html, $utf8WithoutBom)
Write-Output 'Embedded 20 Google Maps restaurant photos.'