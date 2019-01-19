import arff
import numpy as np
from sklearn.svm import SVC


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


def svm_train(trainFeature, trainLabel):
    svmclf = SVC(C=1.0, kernel='rbf', gamma='auto')
    svmclf.fit(trainFeature, trainLabel)

    return svmclf


def svm_test(testFeature, model):
    svmclfOutput = model.predict(testFeature)

    return svmclfOutput


def evaluate(Output, testLabel):
    error = (Output != testLabel).sum()/len(testLabel)
    print('Error: %1.4f' % error)

    return error


def main():
    trainFilename = 'spam_train_500.arff'
    testFilename = 'spam_test.arff'

    trainFeature, trainLabel = loadarff(trainFilename)
    svmclf = svm_train(trainFeature, trainLabel)

    testFeature, testLabel = loadarff(testFilename)
    Output = svm_test(testFeature, svmclf)
    evaluate(Output, testLabel)

    return


if __name__ == '__main__':
    main()
