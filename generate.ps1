.\scripts\restore-packages.ps1
.\scripts\generate-rsp-config.ps1
.\scripts\run-swift-winrt.ps1

[string]::Join("`n", (Get-Content .\Generated\Sources\WindowsFoundation\Windows.Foundation+ABI.swift)).Replace(
    "            _ = try perform(as: __x_ABI_CWindows_CFoundation_CIGuidHelperStatics.self) { pThis in`n                try CHECKED(pThis.pointee.lpVtbl.pointee.Equals(pThis, .init(from: target), .init(from: value), &result))`n            }",
    "            // Removed as a workaround"
) | Set-Content .\Generated\Sources\WindowsFoundation\Windows.Foundation+ABI.swift
