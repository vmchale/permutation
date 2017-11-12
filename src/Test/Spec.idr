module Test.Spec

import Specdris.Spec
import Control.Permutation
import Control.Permutation.Arity
import Data.Vect

export
specSuite : IO ()
specSuite =
  spec $ do
    describe "trivial" $
      it "should permute a vector" $
        toVector trivial `shouldBe` [0, 3, 2, 1]
    describe "cycle precursor" $ do
      it "should give a getElem function" $
        getElem trivial 1 `shouldBe` 3
      it "should give a orbit function" $
        take 4 (orbit trivial 1) `shouldBe` [1, 3, 1, 3]
      it "should give a orbit function" $
        finOrbit trivial 1 `shouldBe` [1, 3]
    describe "cycles" $ do
      it "should be able to find cycles" $ do
        cycles trivial `shouldBe` [[0], [1, 3], [2]]
    describe "decompose" $ do
      it "should be able to factor a permutation as swaps" $ do
        decompose trivial `shouldBe` [(1, 3)]
    describe "getAll" $ do
      it "should work give the right number of elements for n=3" $ do
        length (toVector <$> getAll 3) `shouldBe` 6
  where trivial : Permutation 4
        trivial = pi (FS 0) (FS 2)