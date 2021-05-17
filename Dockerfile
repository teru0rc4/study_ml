# jupyterのdockerイメージを取得
FROM jupyter/datascience-notebook

# ポート解放
EXPOSE 3000

USER root

WORKDIR /usr/src/app

COPY . .
RUN apt-get update \
    && apt-get install -y python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install pipenv && \
    pipenv install --system --ignore-pipfile --deploy

# jupyter notebookでjupyterlabを利用するための設定(jupyter notebook5.3以上なら不要)
RUN jupyter serverextension enable --py jupyterlab --sys-prefix

# ENTRYPOINT: コンテナの実行時にデフォルトで実行するコマンドや引数
ENTRYPOINT ["jupyter-lab", "--ip=0.0.0.0", "--port=3000", "--no-browser", "--allow-root", "--NotebookApp.token=''"]

# CMD: コンテナの実行時にオプションが指定されていない場合設定される引数
# Jupyterlabのルートとなるディレクトリを指定
CMD ["--notebook-dir=/usr/src/app"]