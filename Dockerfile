# tensolflowのdockerイメージを取得
FROM tensorflow/tensorflow

# ポート解放
EXPOSE 3000


WORKDIR /usr/src/app


RUN apt update && apt install -y python3-pip
RUN pip3 install opencv-python
RUN pip3 install matplotlib
RUN pip3 install jupyterlab
# jupyter notebookでjupyterlabを利用するための設定(jupyter notebook5.3以上なら不要)
RUN jupyter serverextension enable --py jupyterlab --sys-prefix


# ENTRYPOINT: コンテナの実行時にデフォルトで実行するコマンドや引数
ENTRYPOINT ["jupyter-lab", "--ip=0.0.0.0", "--port=3000", "--no-browser", "--allow-root", "--NotebookApp.token=''"]

# CMD: コンテナの実行時にオプションが指定されていない場合設定される引数
# Jupyterlabのルートとなるディレクトリを指定
CMD ["--notebook-dir=/usr/src/app"]