import numpy as np

trn_time = np.zeros(1)
#map = np.zeros(4)
i = 0
for bit in [64]:

    results_dir = "./Results/nuswide/"

    db_img_binary = np.load(results_dir + str(bit) + "-" +"db_img_binary.npy")
    np.savetxt(results_dir + str(bit) + "-" +"db_img_binary.txt", db_img_binary)

    db_txt_binary = np.load(results_dir + str(bit) + "-" +"db_txt_binary.npy")
    np.savetxt(results_dir + str(bit) + "-" +"db_txt_binary.txt", db_txt_binary)

    tst_img_binary = np.load(results_dir + str(bit) + "-" +"tst_img_binary.npy")
    np.savetxt(results_dir + str(bit) + "-" +"tst_img_binary.txt", tst_img_binary)

    tst_txt_binary = np.load(results_dir + str(bit) + "-" +"tst_txt_binary.npy")
    np.savetxt(results_dir + str(bit) + "-" +"tst_txt_binary.txt", tst_txt_binary)

    db_label = np.load(results_dir + str(bit) + "-" +"db_label.npy")
    np.savetxt(results_dir + str(bit) + "-" +"db_label.txt", db_label)

    tst_label = np.load(results_dir + str(bit) + "-" +"tst_label.npy")
    np.savetxt(results_dir + str(bit) + "-" +"tst_label.txt", tst_label)

    trn_time[i] = np.load(results_dir + str(bit) + "-" + "trn_time.npy")
    #mAP[i] = np.load(results_dir + str(bit) + "-" + "map.npy")

    i += 1

np.savetxt(results_dir + "trn_time.txt", trn_time)
#np.savetxt(results_dir + "map.txt", mAP)
