package generate

import (
	"crypto/rand"
	"errors"
	"fmt"
	"math/big"
)

func GenerateCode(size int) (string, error) {
	if size <= 0 {
		return "", errors.New("code size must be greater than 0")
	}

	max := new(big.Int).Exp(
		big.NewInt(10),
		big.NewInt(int64(size)),
		nil,
	)

	n, err := rand.Int(rand.Reader, max)
	if err != nil {
		return "", err
	}

	return fmt.Sprintf("%0*d", size, n), nil
}
