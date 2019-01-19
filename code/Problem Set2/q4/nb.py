import arff
import numpy as np
from sklearn.naive_bayes import MultinomialNB


def loadarff(filename):
    arffd = arff.load(open(filename, 'r'))
    data = arffd['data']
    for i in range(len(data)):
        if data[i][-1] == 'spam':
            data[i][-1] = 1
        else:
            data[i][-1] = -1
    dataMatrix = np.array(data)

    feature = dataMatrix[:, 0:-1]
    label = dataMatrix[:, -1]

    return feature, label


def nb_train(trainFeature, trainLabel):
    nbclf = MultinomialNB()
    nbclf.fit(trainFeature, trainLabel)

    return nbclf


def nb_test(testFeature, model):
    nbclfOutput = model.predict(testFeature)

    return nbclfOutput


def evaluate(Output, testLabel):
    error = (Output != testLabel).sum()/len(testLabel)
    print('Error: %1.4f' % error)

    return error


def main():
    trainFilename = 'spam_train_500.arff'
    testFilename = 'spam_test.arff'

    trainFeature, trainLabel = loadarff(trainFilename)
    nbclf = nb_train(trainFeature, trainLabel)

    testFeature, testLabel = loadarff(testFilename)
    Output = nb_test(testFeature, nbclf)
    evaluate(Output, testLabel)

    return


if __name__ == '__main__':
    main()
