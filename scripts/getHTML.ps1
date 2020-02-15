# Assign Parameters
param (
    [string]$site =""
)

# Variables for output location & File's Name
$outDir = "../out"
$outFile = "data.html"


# Check if no arugment given
if($site -eq ""){
    Write-Output "Invalid Argument! 'site' argument is REQUIRED!"
}
else {
    # Output Messages to User
    Write-Output "Output: $outDir$outFile"
    Write-Output "Site: $site"
    Write-Output "Downloading..."

    # Download the site given to output
    Invoke-WebRequest $site -OutFile "$outDir/$outFile"

    # Output when Finished
    Write-Output "Done!"
}
# SIG # Begin signature block
# MIIFuQYJKoZIhvcNAQcCoIIFqjCCBaYCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUy5uABxb+i3Nke4yOeK5wmQDO
# UFKgggNCMIIDPjCCAiqgAwIBAgIQeI4UjHW/goBJUu2bLdM8dDAJBgUrDgMCHQUA
# MCwxKjAoBgNVBAMTIVBvd2VyU2hlbGwgTG9jYWwgQ2VydGlmaWNhdGUgUm9vdDAe
# Fw0xODAxMjMxNjU5MjlaFw0zOTEyMzEyMzU5NTlaMBoxGDAWBgNVBAMTD1Bvd2Vy
# U2hlbGwgVXNlcjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANBg9qmI
# Td1AC69KsNvfMVCO/gNIwsqHHG8feTALR5N03/xmK+4n12LipSJYvdrQN8PGtBE7
# nq/IL/qEYbP0Tljis0+JBr4hmjqeR6lWrMf6QKNgwvPONRIa3SzSIz6DnhV4xJI+
# DSMvHSEgc8yjfm8VCH/6qXWt8euW0ArdxH/5v33QGD9uRDWdui7jyhUmwkCthwO8
# uI2AdSZm4Wc2DIs4QPKMTSFlPhQHmk3EdAxdtg9vawTeak62IJA7Mp0LKFmgy865
# j/HeBbImYiUlCdRCzkd35BkWwsO1YRyzGzGE54yuq+icz6Sl7GFC/MnIPt4y2Zxf
# 9ceUwUu/KjJ837UCAwEAAaN2MHQwEwYDVR0lBAwwCgYIKwYBBQUHAwMwXQYDVR0B
# BFYwVIAQ/EqVYwoms6P1Z8QegbdQzqEuMCwxKjAoBgNVBAMTIVBvd2VyU2hlbGwg
# TG9jYWwgQ2VydGlmaWNhdGUgUm9vdIIQaT3EtOSEdYxMx5lkR6laKTAJBgUrDgMC
# HQUAA4IBAQCNv/hKENGf5QKt50vhjjrMOfzDlwPh3e6syJWKxQcoFUfW1I1HSmk2
# SxZS9M6gQ0jpK0ecwKMTv2poTfPlDtG5XKGj4xA/bRX0+AexsekzYTCx5uvbRgM5
# TYvAmHyyy8buF9ufAawGFQYGY9X1DrRtRi24kjLaw/LCrmX9ASzzhP68fRswY9JG
# o1nUZoRcX7Py7ELFTdT3aaHtY2G8ozY+feDrUU0k9946gG7vpa71t2tOGl1lTXNP
# JQXBXCIS4ipEmNAVgIXY6VohbB5nHu++mw8sJGCU2CLtkMWpgdgok9yclgqjs04t
# l6WNhkqVXsJk20/gEcgCp9qdb8R7CMVKMYIB4TCCAd0CAQEwQDAsMSowKAYDVQQD
# EyFQb3dlclNoZWxsIExvY2FsIENlcnRpZmljYXRlIFJvb3QCEHiOFIx1v4KASVLt
# my3TPHQwCQYFKw4DAhoFAKB4MBgGCisGAQQBgjcCAQwxCjAIoAKAAKECgAAwGQYJ
# KoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQB
# gjcCARUwIwYJKoZIhvcNAQkEMRYEFPvRz+LfkmK14QTFdKZYmzUBFcyBMA0GCSqG
# SIb3DQEBAQUABIIBAGVJD0w57T2E/Yq6N3fCmaYSo/fg0dIQL/+0rb3TOE9WmEjN
# W8h5enfXbEwDrwbbxJytbwTyrGISShpkkTRrs20h7WDcOX4RL6/RJs/D0N32XSMb
# CURZBszIg/13cQ0ctOY7BsU8XMs7T4HPSRZOBvKUTxeGoXkJprS1QI4JstV42nUF
# TI3zqkmMNVOK+OPt/ZIVtQeIEBauzYT9MJap2Oh5wBklQQ1h9QpnXpdxoWfJq/JL
# zdlgK6mmK1ldsh7tq3OUPXm8u2Iio2XpYCp9allRgAEhq1CjHjga9rhH8ddyB+Jz
# g47N4CN5Vw5DQ1RnkOSkiQQDMUGTeVitdjvzYKc=
# SIG # End signature block
