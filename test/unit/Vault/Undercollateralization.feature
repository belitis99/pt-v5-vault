Feature: Undercollateralization
  Scenario: The YieldVault loses underlying assets and is now undercollateralized
    Given Alice owns 15,000,000 Vault shares and Bob owns 5,000,000 Vault shares
    When the YieldVault loses 10,000,000 underlying assets
    Then `isVaultCollateralized` must return false
    Then Alice can only withdraw 7,500,000 underlying assets
    Then Bob can only withdraw 2,500,000 underlying assets

  Scenario: The YieldVault loses underlying assets and is now undercollateralized
    Given Alice owns 15,000,000 Vault shares, Bob owns 5,000,000 Vault shares and the Vault has accrued 400,000 in yield fees
    When the YieldVault loses 10,000,000 underlying assets
    Then `isVaultCollateralized` must return false
    Then no yield fee shares can be minted
    Then Alice can only withdraw 7,800,000 underlying assets
    Then Bob can only withdraw 2,600,000 underlying assets
