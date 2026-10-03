FROM python:3.11
WORKDIR /work
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt \
 && python -m ipykernel install --sys-prefix --name mlops-cia1 --display-name "Python (mlops-cia1)" \
 && git config --global --add safe.directory '*' \
 && git config --global core.autocrlf input
CMD ["python", "-m", "nbconvert", "--to", "notebook", "--execute", "--inplace", "--ExecutePreprocessor.timeout=3600", "MLOps_CIA1_AI4I_Predictive_Maintenance.ipynb"]
