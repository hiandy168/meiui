<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

class ClassificationController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('分类管理');
        parent::initialize();
    }

    /**
     * Shows the index action
     */
    public function indexAction()
    {
        $this->session->conditions = null;
        $this->view->form = new CompaniesForm;
    }


    public function listAction()
    {
        if ($this->request->getQuery("page", "int")){
            $numberPage = $this->request->getQuery("page", "int");
        } else {
            $numberPage = 1;
        }

        $parameters = array();

        $classification = MeiuiClassification::find($parameters);
        if (count($classification) == 0) {
            $this->flash->notice("The search did not find any classification");
            return $this->forward("classification/index");
        }

        $paginator = new Paginator(array(
            "data"  => $classification,
            "limit" => 10,
            "page"  => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
        $this->view->companies = $classification;
    }

    public function editAction($id)
    {

        if (!$this->request->isPost()) {

            $company = Companies::findFirstById($id);
            if (!$company) {
                $this->flash->error("Company was not found");
                return $this->forward("companies/index");
            }

            $this->view->form = new CompaniesForm($company, array('edit' => true));
        }
    }

    /**
     * Creates a new company
     */
    public function createAction()
    {
        if ($this->request->isPost()) {
            $form = new ClassificationForm;
            $company = new MeiuiClassification();

            $data = $this->request->getPost();
            if (!$form->isValid($data, $company)) {
                foreach ($form->getMessages() as $message) {
                    $this->flash->error($message);
                }
                return $this->forward('classification/create');
            }

            if ($company->save() == false) {
                foreach ($company->getMessages() as $message) {
                    $this->flash->error($message);
                }
                return $this->forward('classification/create');
            }

            $form->clear();

            $this->flash->success("classification was created successfully");
            return $this->forward("classification/list");
        } else {
            $this->view->form = new ClassificationForm(null, array('edit' => true));
        }
    }

    /**
     * Saves current company in screen
     *
     * @param string $id
     */
    public function saveAction()
    {
        if (!$this->request->isPost()) {
            return $this->forward("companies/index");
        }

        $id = $this->request->getPost("id", "int");
        $company = Companies::findFirstById($id);
        if (!$company) {
            $this->flash->error("Company does not exist");
            return $this->forward("companies/index");
        }

        $form = new CompaniesForm;

        $data = $this->request->getPost();
        if (!$form->isValid($data, $company)) {
            foreach ($form->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward('companies/new');
        }

        if ($company->save() == false) {
            foreach ($company->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward('companies/new');
        }

        $form->clear();

        $this->flash->success("Company was updated successfully");
        return $this->forward("companies/index");
    }

    /**
     * Deletes a company
     *
     * @param string $id
     */
    public function deleteAction($id)
    {

        $companies = Companies::findFirstById($id);
        if (!$companies) {
            $this->flash->error("Company was not found");
            return $this->forward("companies/index");
        }

        if (!$companies->delete()) {
            foreach ($companies->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward("companies/search");
        }

        $this->flash->success("Company was deleted");
        return $this->forward("companies/index");
    }
}
