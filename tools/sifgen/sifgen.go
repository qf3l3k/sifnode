package sifgen

import (
	"fmt"
	"io/ioutil"
	"log"

	"github.com/MakeNowJust/heredoc"
	"github.com/Sifchain/sifnode/tools/sifgen/key"
	"github.com/Sifchain/sifnode/tools/sifgen/network"
	"github.com/Sifchain/sifnode/tools/sifgen/node"
	"github.com/Sifchain/sifnode/tools/sifgen/utils"

	"github.com/cosmos/cosmos-sdk/crypto/keyring"
)

type Sifgen struct {
	chainID *string
}

func NewSifgen(chainID *string) Sifgen {
	return Sifgen{
		chainID: chainID,
	}
}

func (s Sifgen) NewNetwork(keyringBackend string) *network.Network {
	return &network.Network{
		ChainID: *s.chainID,
		CLI:     utils.NewCLI(*s.chainID, keyringBackend),
	}
}

func (s Sifgen) NetworkCreate(count int, outputDir, startingIPAddress string, outputFile string) {
	net := network.NewNetwork(*s.chainID)
	summary, err := net.Build(count, outputDir, startingIPAddress)
	if err != nil {
		log.Fatal(err)
		return
	}

	if err = ioutil.WriteFile(outputFile, []byte(*summary), 0600); err != nil {
		log.Fatal(err)
		return
	}
}

func (s Sifgen) NetworkReset(networkDir string) {
	if err := network.Reset(*s.chainID, networkDir); err != nil {
		log.Fatal(err)
	}
}

func (s Sifgen) NewNode() *node.Node {
	return &node.Node{
		ChainID: *s.chainID,
		CLI:     utils.NewCLI(*s.chainID, keyring.BackendFile),
	}
}

func (s Sifgen) NodeReset(nodeHomeDir *string) {
	if err := node.Reset(*s.chainID, nodeHomeDir); err != nil {
		log.Fatal(err)
	}
}

func (s Sifgen) KeyGenerateMnemonic(name, password string) {
	newKey := key.NewKey(name, password)
	newKey.GenerateMnemonic()
	fmt.Println(newKey.Mnemonic)
}

func (s Sifgen) KeyRecoverFromMnemonic(mnemonic string) {
	newKey := key.NewKey("", "")
	if err := newKey.RecoverFromMnemonic(mnemonic); err != nil {
		log.Fatal(err)
	}

	fmt.Println(heredoc.Doc(`
		Address: ` + newKey.Address + `
		Validator Address: ` + newKey.ValidatorAddress + `
		Consensus Address: ` + newKey.ConsensusAddress + `
	`))
}
